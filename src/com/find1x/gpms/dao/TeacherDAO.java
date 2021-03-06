package com.find1x.gpms.dao;

import java.util.List;

import org.bson.types.ObjectId;

import com.find1x.gpms.pojos.Student;
import com.find1x.gpms.pojos.Teacher;
import com.find1x.gpms.pojos.User;
import com.find1x.gpms.util.MongoDBUtil;

public class TeacherDAO {
	public static List<Teacher> getList() {
		List<Teacher> list = MongoDBUtil.getDatastore().find(Teacher.class).order("no")
				.asList();
		return list;
	}

	public static List<Student> getStudents(String teacher) {
		List<Student> list = MongoDBUtil.getDatastore().find(Student.class)
				.filter("teacher", teacher).order("no").asList();
		return list;
	}

	public static Teacher getTeacherInfo(String no) {
		Teacher teacher = MongoDBUtil.getDatastore().find(Teacher.class)
				.filter("no", no).get();
		return teacher;
	}

	public static ObjectId addTeacher(String no, String name, String sex,
			String department, String telephone, String email, String postion) {
		try {
			Teacher teacher = new Teacher();
			teacher.setNo(no);
			teacher.setName(name);
			teacher.setSex(sex);
			teacher.setDepartment(department);
			teacher.setTelephone(telephone);
			teacher.setEmail(email);
			teacher.setPostion(postion);
			MongoDBUtil.getDatastore().save(teacher);
			return MongoDBUtil.getDatastore().find(Teacher.class)
					.filter("no", no).get().get_id();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static boolean createUser(ObjectId _id, String username,
			String postion) {
		try {
			User user = new User();
			user.setRefId(_id);
			user.setUsername(username);
			if (postion.equals("教师"))
				user.setType(1);
			else if (postion.equals("教务员"))
				user.setType(2);
			else if (postion.equals("系主任"))
				user.setType(3);
			else
				user.setType(1);
			user.setPassword("123456");
			MongoDBUtil.getDatastore().save(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean existTeacher(String no) {
		if (MongoDBUtil.getDatastore().find(Teacher.class).filter("no", no)
				.get() == null)
			return false;
		else
			return true;
	}

	public static String getName(String no) {
		return MongoDBUtil.getDatastore().find(Teacher.class).filter("no", no)
				.get().getName();

	}

	public static void saveTeacher(Teacher teacher) {
		MongoDBUtil.getDatastore().save(teacher);
	}
}
