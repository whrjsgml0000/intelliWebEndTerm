package com.whrjsgml.config;

public interface FileSetting {
	// .\\resources\\image\\
	// request.getSession().getServletContext().getRealPath("/"); 을 해서 나온 톰캣 배포 위치임.
	public static final String IMAGE_UPLOAD_PATH = "C:\\Users\\CGH\\eclipse-workspace\\IntelliWebEndTerm\\src\\main\\webapp\\resources\\image";
//	public static final String IMAGE_UPLOAD_PATH = "C:\\Users\\whrjs\\Desktop\\intelligent\\IntelliWebEndTerm\\src\\main\\webapp\\resources\\image";
	public static final Long MB = 1024L * 1024L;
	public static final Long UPLOAD_MAX_SIZE = 15 * MB;
	public static final String IMAGE_RELATIVE_PATH = ".\\resources\\image\\";
}
