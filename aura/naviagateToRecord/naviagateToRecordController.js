({    invoke : function(component, event, helper) {
        // Get the record ID attribute
        var record = component.get("v.recordId");
    	// Cerramos el tab del Lead
        var workspaceAPI = component.find("workspace");
    	workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
            workspaceAPI.closeTab({tabId: focusedTabId});
        })
        .catch(function(error) {
            console.log(error);
        });
    	// Abrimos el tab de la cuenta
    
        workspaceAPI.openTab({
            recordId: record,
            focus: true
        }).then(function(response) {
            workspaceAPI.getTabInfo({
                  tabId: response
            }).then(function(tabInfo) {
            console.log("The url for this tab is: " + tabInfo.url);
            });
        })
        .catch(function(error) {
               console.log(error);
        });
    
        }
        })