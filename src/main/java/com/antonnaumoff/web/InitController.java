package com.antonnaumoff.web;


import com.antonnaumoff.utils.exceptions.DataBaseException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.User;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceResponse;
import javax.portlet.ResourceURL;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "VIEW")
public class InitController {

    private Logger logger = Logger.getLogger(this.getClass());

    private static final ObjectMapper JSON_MAPPER = new ObjectMapper();

    @RenderMapping
    public String initLoginPage(RenderRequest request, RenderResponse response, ModelMap model) throws DataBaseException, SystemException {
        logger.info("Main page initialization");
        User user = (User) request.getAttribute(WebKeys.USER);
        String userScreenName = user != null ? user.getScreenName() : "anonymous";
        ResourceURL baseResourceUrl = response.createResourceURL();
        model.addAttribute("ajaxURL", baseResourceUrl.toString());
//        model.addAttribute("standalone", false);
//        model.addAttribute("authenticatedUser", userScreenName);
//        model.addAttribute("portletId", getPortletId(request));
//        model.addAttribute("portletAppContextPath", request.getContextPath() + "/");
        return "initPage";
    }


    @ResourceMapping("getAllUsersAndRoles")
    public void getAllUsersAndRoles(ResourceResponse response) throws SystemException, IOException {
        Map result = new HashMap();
//        UserLocalServiceUtil.getUsers(0, UserLocalServiceUtil.getUsersCount())
//        RoleLocalServiceUtil.getRoles(0, RoleLocalServiceUtil.getRolesCount())
        result.put("users", "ListOfUsers");
        result.put("roles", "ListOfRoles");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        JSON_MAPPER.writeValue(response.getPortletOutputStream(), result);

    }

//    @ResourceMapping("getAllUsersAndRoles")
//    @ResponseBody
//    public Map getAllUsersAndRoles(ResourceResponse response) throws SystemException, IOException {
//        Map result = new HashMap();
//        result.put("users", "ListOfUsers");
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        return result;
//    }
}
