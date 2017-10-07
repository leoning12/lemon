package com.lemon.base.util;

import java.util.UUID;

public class UUIDHelper {
	
	public static String generateUUID(){
		return UUID.randomUUID().toString().toUpperCase();
	}
	public static String generateUUID32(){
		return generateUUID().replace("-", "");
	}
	public static void main(String[] args) {
		System.out.println(generateUUID());
		System.out.println(generateUUID32());
	}

}
