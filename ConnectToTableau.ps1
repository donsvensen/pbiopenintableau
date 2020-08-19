
Function ET-TableauDesktopODCConnection
{  

	[CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $false)]        
		[string]
        $port,
        [Parameter(Mandatory = $false)]        
		[string]
        $database,
        [Parameter(Mandatory = $false)]        
		[string]
        $path	
    )
    
        $tdsXml = "<?xml version='1.0' encoding='utf-8' ?>
<datasource formatted-name='LocalPowerBIDesktopFile' inline='true' source-platform='win' version='18.1' xmlns:user='http://www.tableausoftware.com/xml/user'>
  <document-format-change-manifest>
    <_.fcp.SchemaViewerObjectModel.true...SchemaViewerObjectModel />
  </document-format-change-manifest>
  <connection authentication='sspi' class='msolap' convert-to-extract-prompted='no' dbname='$database' filename='' server='$port' tablename='Model'>
</connection>
</datasource>"   
                
        #the location of the odc file to be opened
        $tdsFile = "$path\tableauconnector.tds"

        $tdsXml | Out-File $tdsFile -Force	

        Invoke-Item $tdsFile

}

ET-TableauDesktopODCConnection -port $args[0] -database $args[1] -path "C:\temp"
