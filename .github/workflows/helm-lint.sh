name: Lint Charts

on: pull_request

jobs:
  shellcheck:
    name: Shellcheck
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Run ShellCheck
      uses: ludeeus/action-shellcheck@master
      with:
        severity: error
  lint-helm:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
        with:
          fetch-depth: 0

      - name: Set up Helm
        uses: azure/setup-helm@v1
        with:
          version: v3.8.1

      - uses: actions/setup-python@v2
        with:
          python-version: 3.8

      - name: Configure Helm dependency repos
        run: |
          helm repo add bitnami https://charts.bitnami.com/bitnami

      - name: Set up chart-testing
        uses: helm/chart-testing-action@v2.2.1

      - name: Run chart-testing (list-changed)
        id: list-changed
        run: |
          changed=$(ct list-changed --target-branch ${{ github.event.repository.default_branch }})
          if [[ -n "$changed" ]]; then
            echo "::set-output name=changed::true"
          fi

      - name: Run chart-testing (lint)
        run: ct lint --target-branch ${{ github.event.repository.default_branch }} --validate-maintainers=false
