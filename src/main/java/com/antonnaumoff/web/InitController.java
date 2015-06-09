package com.antonnaumoff.web;

import com.antonnaumoff.utils.exceptions.DataBaseException;
import com.liferay.portal.kernel.exception.SystemException;
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

import javax.portlet.*;
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
        ResourceURL baseResourceUrl = response.createResourceURL();
        model.addAttribute("ajaxURL", baseResourceUrl.toString());
        model.addAttribute("portletId", getPortletId(request));

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
            one.put("screenName", user.getScreenName());
            one.put("id", user.getUserId());
            result.add(one);
        }
        logger.info("Users number: " + result.size());
        JSON_MAPPER.writeValue(response.getPortletOutputStream(), result);
    }

    @ResourceMapping("resourseURL")
    public void getAllRoles(ResourceRequest resourceRequest, PortletRequest portletRequest, ResourceResponse response) throws SystemException, IOException {

        List result = new ArrayList();
        for (Role role : RoleLocalServiceUtil.getUserRoles(Integer.parseInt(resourceRequest.getParameter("id")))) {
            Map temp = new HashMap();
            temp.put("title", role.getName());
            temp.put("id", role.getUserId());
            temp.put("description", role.getDescriptionCurrentValue());
            result.add(temp);
        }
        logger.info("Roles number: " + result.size());
        JSON_MAPPER.writeValue(response.getPortletOutputStream(), result);
    }
}