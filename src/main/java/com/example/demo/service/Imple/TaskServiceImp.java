package com.example.demo.service.Imple;

import com.example.demo.dao.TaskMapper;
import com.example.demo.entity.Task;
import com.example.demo.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskServiceImp implements TaskService {

    @Autowired
    private TaskMapper taskMapper;

    @Override
    public Task getTaskById(String id) {
        return taskMapper.getTaskById(id);
    }

    @Override
    public int inserttask(Task task) {
        return taskMapper.insert(task);
    }

    @Override
    public void deleteTaskOffice(Task task) {
        taskMapper.deleteTaskOffice(task);
    }

    @Override
    public void insertTaskOffice(Task task) {
        taskMapper.insertTaskOffice(task);
    }

    @Override
    public List<Task> getdoubletaskListByPageAndRows(int page, int rows, String grade,String userId,String office, String topic, String teacher, String teacheridentitynumber, String type, String source) {
        page = (page - 1) * rows;
        return taskMapper.getdoubletaskListByPageAndRows(page, rows, grade, userId,office, topic, teacher, teacheridentitynumber, type, source);
    }

    @Override
    public int getdoubletaskListCountByPageAndRows(int page, int rows, String grade, String userId, String office, String topic, String teacher, String teacheridentitynumber, String type, String source) {
        return taskMapper.getdoubletaskListCountByPageAndRows(page, rows, grade, userId, office, topic, teacher, teacheridentitynumber, type, source);
    }

    @Override
    public void updateTask(Task task) {
        taskMapper.updateByPrimaryKey(task);

    }

    @Override
    public Task getTaskTotalInformationById(String id) {
        return taskMapper.getTaskTotalInformationById(id);
    }

    @Override
    public int deleteTask(Task task) {
        return taskMapper.updateByPrimaryKey(task);
    }

    @Override
    public List<Task> getdoubletaskListByPageAndRowsForAuditDouble(int page, int rows, String grade, String majorid) {
        page = (page - 1) * rows;
        return taskMapper.getdoubletaskListByPageAndRowsForAuditDouble(page,rows,grade,majorid);
    }

    @Override
    public int getdoubletaskListCountByPageAndRowsForAuditDouble(int page, int rows, String grade, String majorid) {
        return taskMapper.getdoubletaskListCountByPageAndRowsForAuditDouble(page, rows, grade, majorid);
    }

    @Override
    public List<Task> getstudentdoubletaskListByPageAndRows(int page, int rows, String grade, String majorid, String office, String topic, String teacher, String teacheridentitynumber, String type, String source) {
        page = (page - 1) * rows;
        return taskMapper.getstudentdoubletaskListByPageAndRows(page, rows, grade, majorid, office, topic, teacher, teacheridentitynumber, type, source);
    }

    @Override
    public int getstudentdoubletaskListCountByPageAndRows(int page, int rows, String grade, String majorid, String office, String topic, String teacher, String teacheridentitynumber, String type, String source) {
        return taskMapper.getstudentdoubletaskListCountByPageAndRows(page, rows, grade, majorid, office, topic, teacher, teacheridentitynumber, type, source);
    }

    @Override
    public List<Task> getviewlogDatafordoubletaskByPageAndRows(int page, int rows, String taskid) {
        page = (page - 1) * rows;
        return taskMapper.getviewlogDatafordoubletaskByPageAndRows(page,rows,taskid);
    }

    @Override
    public int getviewlogDatafordoubletaskCountByPageAndRows(int page, int rows, String taskid) {
        return taskMapper.getviewlogDatafordoubletaskCountByPageAndRows(page, rows, taskid);
    }

    @Override
    public int gettaskstudentjudgehaschosen(String userId) {
        return taskMapper.gettaskstudentjudgehaschosen(userId);
    }

    @Override
    public int gettaskstudentjudgehaschosenThreeTitle(String userId) {
        return taskMapper.gettaskstudentjudgehaschosenThreeTitle(userId);
    }

    @Override
    public int gettaskstudentjudgehaschosenThreePeople(String taskid) {
        return taskMapper.gettaskstudentjudgehaschosenThreePeople(taskid);
    }

    @Override
    public void studentdoublechoose(String taskid, String userId) {
        taskMapper.studentdoublechoose(taskid, userId);
    }

    @Override
    public int gettaskstudentjudgewhetherchoosethistask(String taskid, String userId) {
        return taskMapper.gettaskstudentjudgewhetherchoosethistask(taskid,userId);
    }

    @Override
    public List<Task> gettaskstudenthaschosendoubletaskListDataByPageAndRows(int page, int rows,String userId) {
        page = (page - 1) * rows;
        return taskMapper.gettaskstudenthaschosendoubletaskListDataByPageAndRows(page,rows, userId);
    }

    @Override
    public int gettaskstudenthaschosendoubletaskListDataCountByPageAndRows(int page, int rows, String userId) {
        return taskMapper.gettaskstudenthaschosendoubletaskListDataCountByPageAndRows(page, rows, userId);
    }

    @Override
    public void deletehaschosentopic(String taskid, String userId) {
        taskMapper.deletehaschosentopic(taskid,userId);

    }

    @Override
    public List<Task> getviewchosenstudentallListData(int page, int rows, String userId,String grade) {
        page = (page - 1) * rows;
        return taskMapper.getviewchosenstudentallListData(page,rows,userId, grade);
    }

    @Override
    public int getviewchosenstudentallListDataCountByPageAndRows(int page, int rows, String userId, String grade) {
        return taskMapper.getviewchosenstudentallListDataCountByPageAndRows(page, rows, userId, grade);
    }

    @Override
    public void updateTaskChosenStatus(String taskid, String choosestatusId, String studentId,String status) {
        taskMapper.updateTaskChosenStatus(taskid, choosestatusId, studentId, status);
    }

    @Override
    public void inserttaskchosen(Task task) {
        taskMapper.inserttaskchosen(task);

    }

    @Override
    public List<Task> gettaskstudentreleasetaskListData(int page, int rows, String userId, String grade) {
        page = (page - 1) * rows;
        return taskMapper.gettaskstudentreleasetaskListData(page, rows, userId, grade);
    }

    @Override
    public Task getTaskForstudentchoosemodifyById(String id) {
        return taskMapper.getTaskForstudentchoosemodifyById(id);
    }

    @Override
    public int updatetask(Task task) {
        return taskMapper.updateByPrimaryKey(task);
    }

    @Override
    public void updatetaskchosen(Task task) {
        taskMapper.updatetaskchosen(task);
    }

    @Override
    public List<Task> gettaskviewauditstudentreleaseListData(int page, int rows, String userId,String grade) {
        page = (page - 1) * rows;
        return taskMapper.gettaskviewauditstudentreleaseListData(page,rows,userId,grade);
    }

    @Override
    public List<Task> gettaskteacherassignListData(int page, int rows, String userId, String grade) {
        page = (page - 1) * rows;
        return taskMapper.gettaskteacherassignListData(page, rows, userId, grade);
    }

    @Override
    public List<Task> gettaskviewauditteacherassignListData(int page, int rows, String grade, String majorid) {
        page = (page - 1) * rows;
        return taskMapper.gettaskviewauditteacherassignListData(page, rows, grade, majorid);
    }

    @Override
    public void updatetaskteacherassign(Task task) {
        taskMapper.updatetaskteacherassign(task);
    }

    @Override
    public List<Task> getviewchosenstudentallForanypatternListData(int page, int rows, String userId, String grade) {
        page = (page - 1) * rows;
        return taskMapper.getviewchosenstudentallForanypatternListData(page, rows, userId, grade);
    }

    @Override
    public Task getTaskByIdTrue(String id) {
        return taskMapper.getTaskByIdTrue(id);
    }

    @Override
    public List<Task> getviewauditassignmentbookListData(int page, int rows, String majorid, String grade) {
        page = (page - 1) * rows;
        return taskMapper.getviewauditassignmentbookListData(page, rows, majorid, grade);
    }

    @Override
    public List<Task> getbaseInformationForView(String userId) {
        return taskMapper.getbaseInformationForView(userId);
    }

    @Override
    public Task getreplytimeBymajorid(String majorid) {
        return taskMapper.getreplytimeBymajorid(majorid);
    }

    @Override
    public void insertreplytime(Task task1) {
        taskMapper.insertreplytime(task1);
    }

    @Override
    public void updateschedule(Task task3) {

        taskMapper.updateschedule(task3);

    }

    @Override
    public void insertfinalpaper(Task task) {
        taskMapper.insertfinalpaper(task);
    }

    @Override
    public List<Task> getviewstudentfinalpaperListData(int page, int rows, String userId) {
        page = (page - 1) * rows;
        return taskMapper.getviewstudentfinalpaperListData(page, rows, userId);
    }

    @Override
    public List<Task> getfinalpaperByid(Task task) {
        return taskMapper.getfinalpaperByid(task);
    }

    @Override
    public void updatefinalpaper(Task task) {
        taskMapper.updatefinalpaper(task);
    }

    @Override
    public List<Task> getteacherviewstudentfinalpaperListData(int page, int rows, String userId, String grade) {
        page = (page - 1) * rows;
        return taskMapper.getteacherviewstudentfinalpaperListData(page, rows, userId, grade);
    }

    @Override
    public int getteacherviewstudentfinalpaperCountListData(int page, int rows, String userId, String grade) {
        return taskMapper.getteacherviewstudentfinalpaperCountListData(page, rows, userId, grade);
    }

    @Override
    public List<Task> gettaskallocateassessteacherListData(int page, int rows, String grade, String majorid, String studentname, String studentidentitynumber, String teachername, String teacheridentitynumber, String topic, String assessTeachername, String assessTeacheridentitynumber) {
        page = (page - 1) * rows;
        return taskMapper.gettaskallocateassessteacherListData(page, rows, grade, majorid, studentname, studentidentitynumber, teachername, teacheridentitynumber, topic, assessTeachername, assessTeacheridentitynumber);
    }

    @Override
    public int gettaskallocateassessteacherCountListData(int page, int rows, String grade, String majorid, String studentname, String studentidentitynumber, String teachername, String teacheridentitynumber, String topic, String assessTeachername, String assessTeacheridentitynumber) {
        return taskMapper.gettaskallocateassessteacherCountListData(page, rows, grade, majorid, studentname, studentidentitynumber, teachername, teacheridentitynumber, topic, assessTeachername, assessTeacheridentitynumber);
    }

    @Override
    public List<Task> gettaskviewAllAssessStudentListData(int page, int rows, String userId, String grade) {
        page = (page - 1) * rows;
        return taskMapper.gettaskviewAllAssessStudentListData(page, rows, userId, grade);
    }

    @Override
    public void updateTaskByUserId(String userId) {
        taskMapper.updateTaskByUserId(userId);

    }

    @Override
    public int gettaskstudentjudgechosenpeople(String taskid) {
        return taskMapper.gettaskstudentjudgechosenpeople(taskid);
    }

//    @Override
//    public List<Task> getviewteacherassignListData(int page, int rows, String grade, String majorid) {
//        return taskMapper.getviewteacherassignListData(page, rows, grade, majorid);
//    }


//    @Override
//    public int getdoubletaskListCountByPageAndRows(int page, int rows, String grade, String userId, String office, String topic, String teacher, String teacheridentitynumber, String type, String source) {
//        return taskMapper.getdoubletaskListCountByPageAndRows();
//    }

//    @Override
//    public List<Task> gettaskListByPageAndRowsForAuditDouble(int page, int rows, String grade, String majorid) {
//        return taskMapper.getdoubletaskListByPageAndRows(page,rows,grade,majorid);
//    }
}
