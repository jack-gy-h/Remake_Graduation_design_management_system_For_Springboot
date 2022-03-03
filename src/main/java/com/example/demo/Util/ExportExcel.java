package com.example.demo.Util;

import org.apache.poi.xssf.usermodel.*;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.Iterator;

//import com.jd.xe.web.utils.DateUtil;


/**
 * @author 李光光(编码小王子)
 * @version 1.0
 * @Email 826331692@qq.com
 * @date 2016年7月18日 下午9:03:29
 */
public class ExportExcel<T> {

//i参数代表的是创建第几行的内容
//j参数代表的是利用反射，根据javabean属性的第几个字段
    public void write(int i, int j,XSSFRow row, Field[] fields,T t) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        XSSFCell cell = row.createCell(i);
        System.out.println("cell:" + cell);
        Field field = fields[j];
        String fieldName = field.getName();
        System.out.println("fieldName:" + fieldName);
        String getMethodName = "get" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
        System.out.println("getMethodName:" + getMethodName);
        Class tCls = t.getClass();
        System.out.println("tCls:" + tCls);
        Method getMethod = tCls.getMethod(getMethodName, new Class[]{});
        System.out.println("getMethod:" + getMethod);
        Object value = getMethod.invoke(t, new Object[]{});
        System.out.println("value:" + value);
        // 判断值的类型后进行强制类型转换
        String textValue = null;
        // 其它数据类型都当作字符串简单处理
        if (value != null && value != "") {
            textValue = value.toString();
            System.out.println("textValue:" + textValue);


        }
        if (textValue != null) {
            XSSFRichTextString richString = new XSSFRichTextString(textValue);
            System.out.println("richString:" + richString);

            cell.setCellValue(richString);
//                        System.out.println(cell.get);
        }
        System.out.println("-------------------------------------------------------------------------");
    }

    public void exportExcel(String[] headers, Collection<T> dataset, String fileName, HttpServletResponse response) {
        // 声明一个工作薄
        XSSFWorkbook workbook = new XSSFWorkbook();
        // 生成一个表格
        XSSFSheet sheet = workbook.createSheet(fileName);
        // 设置表格默认列宽度为15个字节
        sheet.setDefaultColumnWidth((short) 20);
        // 产生表格标题行
        XSSFRow row = sheet.createRow(0);
        System.out.println(headers.length);
        for (short i = 0; i < headers.length; i++) {
            XSSFCell cell = row.createCell(i);
            XSSFRichTextString text = new XSSFRichTextString(headers[i]);
            cell.setCellValue(text);
        }
        try {
            // 遍历集合数据，产生数据行
            Iterator<T> it = dataset.iterator();
            int index = 0;
            while (it.hasNext()) {
                index++;
                row = sheet.createRow(index);
                T t = (T) it.next();
                // 利用反射，根据javabean属性的先后顺序，动态调用getXxx()方法得到属性值
                Field[] fields = t.getClass().getDeclaredFields();
//                for (short i = 0; i < 19; i++) {
                write(0,1,row,fields,t);
                write(1,2,row,fields,t);
                write(2,3,row,fields,t);
//                }
            }
            getExportedFile(workbook, fileName, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 方法说明: 指定路径下生成EXCEL文件
     *
     * @return
     */
    public void getExportedFile(XSSFWorkbook workbook, String name, HttpServletResponse response) throws Exception {
        BufferedOutputStream fos = null;
        try {
            String fileName = name+".xlsx";
            response.setContentType("application/x-msdownload");
            response.setHeader("Content-Disposition", "attachment;filename=" + new String(fileName.getBytes("gb2312"), "ISO8859-1"));
            fos = new BufferedOutputStream(response.getOutputStream());
            workbook.write(fos);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (fos != null) {
                fos.close();
            }
        }
    }

}