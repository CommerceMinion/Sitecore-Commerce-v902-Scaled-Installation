Import-Module SitecoreFundamentals

Import-Module SitecoreInstallFramework

#$solrParams = @{     
#    Path = "$PSScriptRoot\sitecore-solr.json"     
#    SolrUrl = $SolrUrl     
#    SolrRoot = $SolrRoot     
#    SolrService = $SolrService     
#    CorePrefix = $prefix 
#} 

#Install-SitecoreConfiguration @solrParams 
 
#install client certificate for xconnect 
$certParams = @{     
    Path = ".\createrootcert.json"
    } 
    
Install-SitecoreConfiguration @certParams -Verbose 
 
