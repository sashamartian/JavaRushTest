package userManagerApp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import userManagerApp.model.User;
import userManagerApp.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class UserController {
    private UserService userService;

    @Autowired
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String indexPage(HttpServletRequest request, Model model) {
        PagedListHolder pagedListHolder = new PagedListHolder(this.userService.getAllUsers());
        int page = ServletRequestUtils.getIntParameter(request,"page",0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(5);

        model.addAttribute("allUsers", pagedListHolder);

        return "index";
    }

    @RequestMapping(value = "/useradd",method = RequestMethod.GET)
    public String userEditor(@ModelAttribute("user") User user){

        return "users_edit";
    }

    @RequestMapping(value = "/useredit/add",method = RequestMethod.POST)
    public String addUser(@Valid @ModelAttribute("user") User user, BindingResult bindingResult){
        if(bindingResult.hasErrors()) {
            return "users_edit";
        }

        if(user.getId() == 0) {
            this.userService.addUser(user);
        } else {
            this.userService.updateUser(user);
        }

        return "redirect: /UserManger/";
    }

}
