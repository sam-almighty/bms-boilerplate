# MobileFirst Services Starter Boilerplate

This repository contains the code used to create [MobileFirst Services Starter](https://console.ng.bluemix.net/catalog/starters/mobilefirst-services-starter/) in the [IBM Cloud Catalog](https://console.bluemix.net/catalog/?category=blueprints).

IBM Cloud Starter (a.k.a Boilerplate) is a web application exposing a `metadata.json` file that contains information used by IBM Cloud Catalog, such as Boilerplate name, description and icons. One of the important pieces of information contained in the `metadata.json` file is type of runtime environment to be created and services to be provisioned should user choose to create this boilerplate. The `metadata.json` file allows to specify a git URL for a repository that will be used as a template application in the instantiated runtime. This URL can be either external (e.g. URL of a github.com repository) or internal, pointing to the git repository inside of the boilerplate application. In the latter case you will need to store a template application inside the boilerplate app as a resource and generate a local git repository for it. 

The MobileFirst Starter Boilerplate artifact deployed to IBM Cloud is essentially a Java web app (a `.war` file) with following structure:

```
\
- .cfignore
\ imf
   \ .git
      - [git files]
   \ bms-hellotodo-strongloop
      - [template application resources]
   - metadata.json
   - [set of icons]
\ META-INF
   - MANIFEST.MF
\ WEB-INF
   - web.xml

```

The `bms-hello-strongloop` folder is not part of this repository. It is hosted in a separate [GitHub repository](https://github.com/ibm-bluemix-mobile-services/bms-hellotodo-strongloop) which is cloned dynamically in `buildwar.sh` script. This is to allow developers to use the `bms-hello-strongloop` as a stand-alone sample.

The `buildwar.sh` script performs following steps:

1. Clones the `development` branch of `https://github.com/ibm-bluemix-mobile-services/bms-hellotodo-strongloop` repository which contains a template application to be used in a boilerplate. 

2. Generates a local git repository in `boilerplate/imf` folder. This is an IBM Cloud Boilerplate requirement. 

3. Generates `boilerplate.war` and copies `manifest.yml` to the `\target` directory.

4. Performs additional clean up. 

Both files `boilerplate.war` and `manifest.yml` files from `\target` directory are published to UCD CodeStation. This process is out of scope of this repository and handled separately by a Jenkins job. Note that both `manifest.yml` and `metadata.json` files contain deployment-related placeholders which are replaced by real values during UCD deploy process. 

