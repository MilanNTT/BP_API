sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"bp/businesspartnerrequest/test/integration/pages/ProcessStepList",
	"bp/businesspartnerrequest/test/integration/pages/ProcessStepObjectPage"
], function (JourneyRunner, ProcessStepList, ProcessStepObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('bp/businesspartnerrequest') + '/test/flp.html#app-preview',
        pages: {
			onTheProcessStepList: ProcessStepList,
			onTheProcessStepObjectPage: ProcessStepObjectPage
        },
        async: true
    });

    return runner;
});

