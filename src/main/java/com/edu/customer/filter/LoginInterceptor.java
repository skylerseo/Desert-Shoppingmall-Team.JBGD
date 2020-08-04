package com.edu.customer.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.edu.customer.model.CustomerDto;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		CustomerDto customerDto = (CustomerDto) session.getAttribute("customer");
		String referer = request.getHeader("Referer");
		String requestUrl = request.getRequestURL().toString();

		if (requestUrl.contains("./SessionError.jsp")) {

			return true;	
		}
		if (customerDto == null) {
			session.setAttribute("redirect", referer);
			response.sendRedirect("./SessionError.jsp");

			return false;
		}

		return super.preHandle(request, response, handler);

	}
}