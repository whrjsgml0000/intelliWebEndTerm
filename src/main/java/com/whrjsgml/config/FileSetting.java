package com.whrjsgml.config;

import org.apache.catalina.connector.Request;

public interface FileSetting {
//	public static final String IMAGE_UPLOAD_PATH = "C:\\Users\\CGH\\eclipse-workspace\\IntelliWebEndTerm\\src\\main\\webapp\\resources\\image";
//	public static final String IMAGE_UPLOAD_PATH = "C:\\Users\\whrjs\\Desktop\\intelligent\\IntelliWebEndTerm\\src\\main\\webapp\\resources\\image";
//	public static final String IMAGE_UPLOAD_PATH = System.getProperty("user.dir");
	public static final Long MB = 1024L * 1024L;
	public static final Long UPLOAD_MAX_SIZE = 15 * MB;
	public static final String IMAGE_RELATIVE_PATH = "./resources/image/";
}
