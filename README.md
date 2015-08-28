# Share-custom-form-controls
This project contains a couple of reusable custom form controls for Alfresco Share.

The project is composed for a Share Amp and also a Repo Amp. This last one is only for test purposes leveraging a custom model using the included custom form controls. So you only need to worry about installing the Share amp.

## Custom Form Controls Included

A [share-config-custom.xml](https://github.com/rjmfernandes/share-custom-form-controls/blob/master/share-custom-fc-share/src/test/resources/alfresco/web-extension/share-config-custom.xml) is included for test and guiding purposes and referencing the [custom model](https://github.com/rjmfernandes/share-custom-form-controls/blob/master/share-custom-fc-repo/src/main/amp/config/alfresco/module/share-custom-fc-repo/model/sampleModel.xml) included on the repository amp. 

### Hierarchical Drop Lists

The custom form controls related are the following ones: 

* [parent-filter-selectone.ftl](https://github.com/rjmfernandes/share-custom-form-controls/blob/master/share-custom-fc-share/src/main/amp/config/alfresco/web-extension/site-webscripts/org/alfresco/components/form/controls/parent-filter-selectone.ftl)
* [filtered-selectone.ftl](https://github.com/rjmfernandes/share-custom-form-controls/blob/master/share-custom-fc-share/src/main/amp/config/alfresco/web-extension/site-webscripts/org/alfresco/components/form/controls/filtered-selectone.ftl)  

Those controls are discussed in this [post](http://blogs.alfresco.com/wp/rfernandes/2012/02/06/form-control-dependency-in-alfresco-share/).

### Multiple select as checkboxes

The corresponding form control [selectmany_checkbox.ftl](https://github.com/rjmfernandes/share-custom-form-controls/blob/master/share-custom-fc-share/src/main/amp/config/alfresco/web-extension/site-webscripts/org/alfresco/components/form/controls/selectmany_checkbox.ftl).

### Special Text Fields

Two examples are included:

* Email Field [emailfield.ftl](https://github.com/rjmfernandes/share-custom-form-controls/blob/master/share-custom-fc-share/src/main/amp/config/alfresco/web-extension/site-webscripts/org/alfresco/components/form/controls/emailfield.ftl)
* URL field [urlfield.ftl](https://github.com/rjmfernandes/share-custom-form-controls/blob/master/share-custom-fc-share/src/main/amp/config/alfresco/web-extension/site-webscripts/org/alfresco/components/form/controls/urlfield.ftl)

## Other useful form customisation related extensions

The following are not included as part of this extension and are registered for reference only.

* [uploader-plus](https://github.com/softwareloop/uploader-plus)
* [multivalueFormControl](https://github.com/donaanacounty/multivalueFormControl)
* [alfresco-datatable-property](https://github.com/msvoren/alfresco-datatable-property)
* [tabbed-form](https://github.com/rjmfernandes/tabbed-form)