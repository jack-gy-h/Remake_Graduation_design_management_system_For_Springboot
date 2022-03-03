package com.example.demo.service;

import com.example.demo.entity.Task;

import java.util.List;

public interface TaskService {
    Task getTaskById(String id);

    int inserttask(Task task);

    void deleteTaskOffice(Task task);

    void insertTaskOffice(Task task);

    List<Task> getdoubletaskListByPageAndRows(int page, int rows, String grade, String userId, String office, String topic, String teacher, String teacheridentitynumber, String type, String source);

    int getdoubletaskListCountByPageAndRows(int page, int rows, String grade, String userId, String office, String topic, String teacher, String teacheridentitynumber, String type, String source);

    void updateTask(Task task);

    Task getTaskTotalInformationById(String id);

    int deleteTask(Task task);

    List<Task> getdoubletaskListByPageAndRowsForAuditDouble(int page, int rows, String grade, String majorid);

    int getdoubletaskListCountByPageAndRowsForAuditDouble(int page, int rows, String grade, String majorid);

    List<Task> getstudentdoubletaskListByPageAndRows(int page, int rows, String grade, String majorid, String office, String topic, String teacher, String teacheridentitynumber, String type, String source);

    int getstudentdoubletaskListCountByPageAndRows(int page, int rows, String grade, String majorid, String office, String topic, String teacher, String teacheridentitynumber, String type, String source);

    List<Task> getviewlogDatafordoubletaskByPageAndRows(int page, int rows, String taskid);

    int getviewlogDatafordoubletaskCountByPageAndRows(int page, int rows, String taskid);

    int gettaskstudentjudgehaschosen(String userId);

    int gettaskstudentjudgehaschosenThreeTitle(String userId);

    int gettaskstudentjudgehaschosenThreePeople(String taskid);

    void studentdoublechoose(String taskid, String userId);

    int gettaskstudentjudgewhetherchoosethistask(String taskid, String userId);

    List<Task> gettaskstudenthaschosendoubletaskListDataByPageAndRows(int page, int rows,String userId);

    int gettaskstudenthaschosendoubletaskListDataCountByPageAndRows(int page, int rows, String userId);

    void deletehaschosentopic(String taskid, String userId);

    List<Task> getviewchosenstudentallListData(int page, int rows, String userId,String grade);

    int getviewchosenstudentallListDataCountByPageAndRows(int page, int rows, String userId, String grade);

    void updateTaskChosenStatus(String taskid, String choosestatusId, String studentId,String status);

    void inserttaskchosen(Task task);

    List<Task> gettaskstudentreleasetaskListData(int page, int rows, String userId, String grade);

    Task getTaskForstudentchoosemodifyById(String id);

    int updatetask(Task task);

    void updatetaskchosen(Task task);

    List<Task> gettaskviewauditstudentreleaseListData(int page, int rows,String userId,String grade);

    List<Task> gettaskteacherassignListData(int page, int rows, String userId, String grade);

    List<Task> gettaskviewauditteacherassignListData(int page, int rows, String grade, String majorid);

    void updatetaskteacherassign(Task task);

    List<Task> getviewchosenstudentallForanypatternListData(int page, int rows, String userId, String grade);

    Task getTaskByIdTrue(String id);

    List<Task> getviewauditassignmentbookListData(int page, int rows, String majorid, String grade);

    List<Task> getbaseInformationForView(String userId);

    Task getreplytimeBymajorid(String majorid);

    void insertreplytime(Task task1);

    void updateschedule(Task task3);

    void insertfinalpaper(Task task);

    List<Task> getviewstudentfinalpaperListData(int page, int rows, String userId);

    List<Task> getfinalpaperByid(Task task);

    void updatefinalpaper(Task task);

    List<Task> getteacherviewstudentfinalpaperListData(int page, int rows, String userId, String grade);

    int getteacherviewstudentfinalpaperCountListData(int page, int rows, String userId, String grade);

    List<Task> gettaskallocateassessteacherListData(int page, int rows, String grade, String majorid, String studentname, String studentidentitynumber, String teachername, String teacheridentitynumber, String topic, String assessTeachername, String assessTeacheridentitynumber);

    int gettaskallocateassessteacherCountListData(int page, int rows, String grade, String majorid, String studentname, String studentidentitynumber, String teachername, String teacheridentitynumber, String topic, String assessTeachername, String assessTeacheridentitynumber);

    List<Task> gettaskviewAllAssessStudentListData(int page, int rows, String userId,String grade);

    void updateTaskByUserId(String userId);

    int gettaskstudentjudgechosenpeople(String taskid);

//    List<Task> getviewteacherassignListData(int page, int rows, String grade, String majorid);


//    List<Task> gettaskListByPageAndRowsForAuditDouble(int page, int rows, String grade, String majorid);
}
