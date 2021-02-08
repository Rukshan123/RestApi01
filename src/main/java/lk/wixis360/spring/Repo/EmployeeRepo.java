package lk.wixis360.spring.Repo;

import lk.wixis360.spring.Entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepo extends JpaRepository<Employee, String>{

}
