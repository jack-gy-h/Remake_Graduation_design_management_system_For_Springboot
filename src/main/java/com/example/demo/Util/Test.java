package com.example.demo.Util;

import org.springframework.core.io.ClassPathResource;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.jar.JarOutputStream;

/**
 * 功能描述
 *
 * @author: wujiajian
 * @date: 2022年12月04日 22:37
 */

public class Test {

    static HashMap<String,String> map = new HashMap<>();

    public static void main(String[] args) throws IOException {
        //修改SpringBoot的application.yml文件内容：说白了就是覆盖原先内容
        String data = "12j3h1i7tsa7sgdajk123y8asd: 88888";
        //jar位置
        File jarFile = new File(new Test().getJarPath());
        //新jar包位置
        File tempJar = upJarFile(jarFile, "BOOT-INF/classes/application.properties", data);

//        JarFile jarFile1 = new JarFile(tempJar);

        File tempJar1 = upJarFile1(tempJar, "BOOT-INF/classes/application.properties", data);

//        for (Map.Entry<String, String> a:map.entrySet()) {
//            System.out.println(a.getKey()+"\n"+a.getValue());
//        }
    }

    /**
     * 修改jar文件内容
     * 原理其实就是获取到原jar文件后拿到其所有的JarEntry，也就是下面的文件夹
     * 创建一个新的jar，将获取到的原jar JarEntry put到新jar中
     * 循环到需要修改的文件时自己 new JarEntry，否则会字节数、编码不同报错
     * 然后将新jar输出到指定地址
     *
     * @param originalJarFile jar文件
     * @param editFilePath    要修改的文件地址，例如SpringBoot项目的jar包：BOOT-INF/class/application.yml
     * @param content         要写入的内容（这里会覆盖原文件所有内容）
     */
    public static File upJarFile(File originalJarFile, String editFilePath, String content) throws IOException {
        //创建临时文件
        File tempFile = File.createTempFile("temp", ".jar");
        //获取jar文件
        JarFile jarFile = new JarFile(originalJarFile);
        //获取当前jar中的所有文件
        Enumeration<JarEntry> entries = jarFile.entries();
        System.out.println("before:"+ originalJarFile.length());
        //创建同名jar
        JarOutputStream jarOutputStream = new JarOutputStream(new FileOutputStream(tempFile));
        while (entries.hasMoreElements()) {
            //获取原jar包下的文件
            JarEntry jarEntry = entries.nextElement();
            //匹配是否是需要更改的文件
            //添加到新jar包中
            jarOutputStream.putNextEntry(jarEntry);
            map.put(jarEntry.getName(), String.valueOf(jarEntry.getSize()));
            jarOutputStream.write(new Test().inputStreamToByteArray(jarFile.getInputStream(jarEntry)));
        }
        jarOutputStream.finish();
        jarOutputStream.close();
        System.out.println(tempFile.getPath());
        System.out.println("after:" + tempFile.length());
        return tempFile;
    }

    /**
     * 修改jar文件内容
     * 原理其实就是获取到原jar文件后拿到其所有的JarEntry，也就是下面的文件夹
     * 创建一个新的jar，将获取到的原jar JarEntry put到新jar中
     * 循环到需要修改的文件时自己 new JarEntry，否则会字节数、编码不同报错
     * 然后将新jar输出到指定地址
     *
     * @param originalJarFile jar文件
     * @param editFilePath    要修改的文件地址，例如SpringBoot项目的jar包：BOOT-INF/class/application.yml
     * @param content         要写入的内容（这里会覆盖原文件所有内容）
     */
    public static File upJarFile1(File originalJarFile, String editFilePath, String content) throws IOException {
        //创建临时文件
        File tempFile = File.createTempFile("temp", ".jar");
        //获取jar文件
        JarFile jarFile = new JarFile(originalJarFile);
        //获取当前jar中的所有文件
        Enumeration<JarEntry> entries = jarFile.entries();
        System.out.println("before1:" + originalJarFile.length());
        //创建同名jar
        JarOutputStream jarOutputStream = new JarOutputStream(new FileOutputStream(tempFile));
        while (entries.hasMoreElements()) {
            //获取原jar包下的文件
            JarEntry jarEntry = entries.nextElement();
            //匹配是否是需要更改的文件
            //添加到新jar包中
            jarOutputStream.putNextEntry(jarEntry);
            jarOutputStream.write(new Test().inputStreamToByteArray(jarFile.getInputStream(jarEntry)));
            if (!map.getOrDefault(jarEntry.getName(), "").equals(jarEntry.getSize())){
                map.put(jarEntry.getName(), map.getOrDefault(jarEntry.getName(), "")+"-->"+jarEntry.getSize());
            }
        }
        jarOutputStream.finish();
        jarOutputStream.close();
        System.out.println(tempFile.getPath());
        System.out.println("after1:" + tempFile.length());
        return tempFile;
    }

    public String getJarPath() {
        String path1 = System.getProperty("user.dir");
        File file = new File(path1 + "/target/");
        String jarFile = null;
        for (File file1 : file.listFiles()) {
            if (file1.getName().endsWith(".jar")) {
                jarFile = file1.getPath();
                break;
            }
        }
        return jarFile;
    }

    /**
     * inputStream转byte数组
     *
     * @param inputStream 输入流对象
     * @return byte数组
     */
    public byte[] inputStreamToByteArray(InputStream inputStream) {
        try (ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[1024];
            int num;
            while ((num = inputStream.read(buffer)) != -1) {
                byteArrayOutputStream.write(buffer, 0, num);
            }
            byteArrayOutputStream.flush();
            return byteArrayOutputStream.toByteArray();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new byte[]{};
    }

}
