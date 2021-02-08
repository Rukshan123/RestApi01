package lk.wixis360.spring.Service;

import lk.wixis360.spring.Dto.EmployeeDTO;

import java.util.List;

public interface EmployeeService {
    void saveEmployee(EmployeeDTO dto);
    void UpdateEmployee(EmployeeDTO dto);

    EmployeeDTO searchEmployee(String id);
    void deleteEmployee(String id);
    List<EmployeeDTO> getAllEmployee();
}
