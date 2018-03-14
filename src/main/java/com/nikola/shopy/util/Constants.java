package com.nikola.shopy.util;

import java.util.concurrent.TimeUnit;

public class Constants {
	public static final String HEADER_NAME = "X-Auth-Token";
	public static final String JWT_SECRET = "9gag-is-awesome-isnt-it";
	public static final String BEARER = "Bearer: ";
	public static final Long JWT_TOKEN_DURATION = TimeUnit.HOURS.toMillis(5);
}
