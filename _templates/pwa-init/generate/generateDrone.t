---
to: .drone.yml
---
---
kind: pipeline
name: default

steps:
  - name: restore-yarn-cache
    image: meltwater/drone-cache:1.0.4
    environment:
      AWS_ACCESS_KEY_ID:
        from_secret: AWS_ACCESS_KEY_ID
      AWS_SECRET_ACCESS_KEY:
        from_secret: AWS_SECRET_ACCESS_KEY
    pull: true
    settings:
      pull: true
      restore: true
      cache_key: "yarn"
      bucket: qoala-build-drone-cache
      region: ap-southeast-1
      mount:
        - ".yarn-cache"
    when:
      branch:
        include:
          - master
          - rc
          - release

  # ====================  DEVELOPMENT  =======================
  - name: build-dev
    image: node
    pull: true
    environment:
      NPM_TOKEN:
        from_secret: NPM_TOKEN
    commands:
      - yarn config set cache-folder `pwd`/.yarn-cache
      - yarn install
      - NODE_ENV=development yarn build:dev
    when:
      branch: master

  - name: deploy-dev
    image: plugins/s3-sync:1.3.0
    settings:
      bucket: null
      access_key:
        from_secret: AWS_ACCESS_KEY_ID
      secret_key:
        from_secret: AWS_SECRET_ACCESS_KEY
      region: ap-southeast-1
      source: dist
      target: /
      delete: true
      acl:
        "*": public-read
      content_type:
        ".svg": image/svg+xml
        ".js": "text/javascript"
        ".css": "text/css"
      cloudfront_distribution: null

    when:
      branch: master

  # ====================  PRODUCTION  =======================
  - name: build-prod
    image: node
    pull: true
    commands:
      - yarn config set cache-folder `pwd`/.yarn-cache
      - yarn install
      - NODE_ENV=production yarn build:prod
    when:
      branch: release

  - name: deploy-prod
    image: plugins/s3-sync:1.3.0
    settings:
      bucket: null
      access_key:
        from_secret: AWS_ACCESS_KEY_ID
      secret_key:
        from_secret: AWS_SECRET_ACCESS_KEY
      region: ap-southeast-1
      source: dist
      target: /
      acl:
        "*": public-read
      content_type:
        ".svg": image/svg+xml
        ".js": "text/javascript"
        ".css": "text/css"
      cloudfront_distribution: null
    when:
      branch: release
  # ==================================================

  - name: rebuild-yarn-cache
    image: meltwater/drone-cache:1.0.4
    pull: true
    environment:
      AWS_ACCESS_KEY_ID:
        from_secret: AWS_ACCESS_KEY_ID
      AWS_SECRET_ACCESS_KEY:
        from_secret: AWS_SECRET_ACCESS_KEY
    settings:
      rebuild: true
      cache_key: "yarn"
      bucket: qoala-build-drone-cache
      region: ap-southeast-1
      mount:
        - ".yarn-cache"
    when:
      branch:
        include:
          - master
          - release
cache:
  mount:
    - node_modules
    - .git
