package com.citychurch.store;

import com.citychurch.models.User;
import java.util.concurrent.ConcurrentHashMap;
import java.util.Map;

public class UserDataStore {
    public static final Map<String, User> users = new ConcurrentHashMap<>();
}