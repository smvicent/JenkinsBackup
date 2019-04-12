({
    disableCloseFocusedTab : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
            var doNotClose = component.get('v.disableTab');
            
            workspaceAPI.disableTabClose({
                tabId: focusedTabId,
                disabled: false
        })
        .then(function(tabInfo) {
            console.log(tabInfo);
        })
        .catch(function(error) {
            console.log(error);
        });
    })
    .catch(function(error) {
        console.log(error);
    });
    }
})