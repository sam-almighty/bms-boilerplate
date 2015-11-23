# MobileFirst Services Starter Boilerplate

This repository contains the code used to create MobileFirst Services Starter in the Bluemix Catalog - [https://console.ng.bluemix.net/catalog/starters/mobilefirst-services-starter](https://console.ng.bluemix.net/catalog/starters/mobilefirst-services-starter)

Bluemix Starter (a.k.a Boilerplate) is a web application exposing a `metadata.json` file that contains information used by Bluemix catalog, such as boilerplate name. One of the important pieces of information contained in the `metadata.json` file is type of runtime environment to be created and services to be provisioned should user choose to create this boilerplate. The `metadata.json` file allows to specify a git URL for a repository that will be used as a template application in the instantiated runtime. This URL can be either external (e.g. a github.com repository URL) or internal, poiting to the resource inside of the boilerplate application. In case of the internal URL you'll need to store a template application inside of the boilerplate app as a resouce and generate a local git repository for it. 

The MobileFirst Starter Boilerplate artifact deployed to Bluemix is essentially a `.war` file with following structure:

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

The `bms-hello-strongloop` is not part of this repository. It is hosted in a separate [Github repository](https://github.com/ibm-bluemix-mobile-services/hellotodo-strongloop) which is cloned dynamically via `buildwar.sh` script. This is to allow developers to use the `bms-hello-strongloop` as a stand-alone sample.

The `buildwar.sh` script performs following steps

1. Clones the `development` branch of `https://github.com/ibm-bluemix-mobile-services/hellotodo-strongloop` repository which contains a template application to be used in a boilerplate. 

2. Generates a local git repositority in `boilerplate/imf` folder. This is a Bluemix Boilerplate requirement. 

3. Generates `boilerplate.war` and copies `manifest.yml` to the `\target` directory.

4. Performs additional clean up 

Both files from `\target` directory are published to UCD CodeStation using Jenkins. This process is out of scope of this repo and handled separately. Note that both `manifest.yml` and `metadata.json` files contain placeholders which are replaced by real values using UCD deploy process. 

