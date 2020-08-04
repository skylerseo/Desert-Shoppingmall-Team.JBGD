package com.edu.util;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

@Component("sessionCheck")
public class SessionCheck {

	public boolean sessionInfo(HttpSession session) {
		
		if (session == null) {
			return false;
		}
		return true;
	}
	
}
