package com.antonnaumoff.web;


import com.antonnaumoff.utils.exceptions.DataBaseException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.User;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.service.UserLocalServiceUtil;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.liferay.portal.util.PortalUtil.getPortletId;

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
        model.addAttribute("portletId", getPortletId(request));
//        model.addAttribute("portletAppContextPath", request.getContextPath() + "/");
        return "initPage";
    }


    @ResourceMapping("getAllUsersAndRoles")
    public void getAllUsersAndRoles(ResourceResponse response) throws SystemException, IOException {

        List result = new ArrayList();
        for (User user : UserLocalServiceUtil.getUsers(0, UserLocalServiceUtil.getUsersCount())) {
            Map one = new HashMap();
            one.put("firstName", user.getFirstName());
            one.put("secondName", user.getLastName());
            one.put("fullName", user.getFullName());
            one.put("id", user.getUserId());
            result.add(one);
        }

//        RoleLocalServiceUtil.getRoles(0, RoleLocalServiceUtil.getRolesCount())
//        result.put("users", " ");
//        result.put("roles", "ListOfRoles");
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//
//        Gson gson = new Gson();
//        String  = gson.toJson();

        JSON_MAPPER.writeValue(response.getPortletOutputStream(), result);
    }


    @ResourceMapping("getAllRolesById}")
    public void getAllRoles(ResourceResponse response) throws SystemException, IOException {
//TODO pass id by post body!!!
        List result = new ArrayList();
        for (Role role : RoleLocalServiceUtil.getUserRoles(10248)) {
            Map temp = new HashMap();
            temp.put("title", role.getTitle());
            temp.put("id", role.getUserId());
            result.add(temp);
        }
        JSON_MAPPER.writeValue(response.getPortletOutputStream(), result);
    }
}