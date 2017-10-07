package com.lemon.system.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lemon.base.service.impl.BaseService;
import com.lemon.system.dao.UserDao;
import com.lemon.system.entity.SysUser;

@Service
@Transactional
public class UserService extends BaseService<SysUser>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2625422570098122664L;
	@Autowired
	private UserDao userDao;

}
