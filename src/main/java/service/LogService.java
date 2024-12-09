package service;

import dao.LogDao;
import model.Log;

import java.util.List;

public class LogService {
    private static LogService instance;
    public static LogService getInstance() {
        if (instance == null)
            instance = new LogService();
        return instance;
    }
    public static List<Log> getAllLog(){
        return LogDao.getAllLog();
    }
    public static Log getLogById(int id){
        return LogDao.getLogById(id);
    }

}
