using system;
using system.web;
using system.web.ui;
using system.web.ui.webcontrols;

namespace webapplication1
{
    public class global : system.web.httpapplication
    {
        protected void application_start(object sender, eventargs e)
        {
            // 教材p96 必须加的3句代码
            scriptresourcedefinition scriptresdef = new scriptresourcedefinition();
            scriptresdef.path = "https://code.jquery.com/jquery-3.6.0.min.js";
            scriptmanager.scriptresourcemapping.adddefinition("jquery", scriptresdef);
        }
    }
}