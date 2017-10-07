package com.lemon.system.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lemon.base.service.impl.BaseService;
import com.lemon.system.dao.SysMenuDao;
import com.lemon.system.entity.SysMenu;

@Service
@Transactional
public class SysMenuService extends BaseService<SysMenu>{

	private static final long serialVersionUID = 3735733360250379711L;
	@Autowired
	private SysMenuDao sysMenuDao;

}
