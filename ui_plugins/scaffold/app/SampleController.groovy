import org.hyperic.hq.ui.rendit.BaseController

class SampleController 
	extends BaseController
{
    def SampleController() {
        setTemplate('standard')  // in views/templates/standard.gsp 
    }
    
    def index = { params ->
    	render(locals:[ pluginInfo : pluginInfo ])
    }
}
