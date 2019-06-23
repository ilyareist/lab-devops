pytest:
    stage: test
    image: registry.exness.io/dockerhub/python:3.7-alpine-pst
    variables:
      EXNESS_APP_SETTINGS: tests/config.yml
      PGAPPNAME: pst_wl_payment_api
      PIP_INDEX_URL: http://nexus.prod.env/repository/pypi/simple
      PIP_TRUSTED_HOST: nexus.prod.env
    script:
      - apk add --update --no-cache g++ gcc libxslt-dev
      - pip install -e .[tests]
      - make test

