package lk.wixis360.spring.Service.Impl;

import lk.wixis360.spring.Dto.EmployeeDTO;
import lk.wixis360.spring.Entity.Employee;
import lk.wixis360.spring.Repo.EmployeeRepo;
import lk.wixis360.spring.Service.EmployeeService;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    EmployeeRepo repo;
    @Autowired
    ModelMapper mapper;


    @Override
    public void saveEmployee(EmployeeDTO dto) {
        if (!repo.existsById(dto.getId())) {
            Employee e = mapper.map(dto, Employee.class);
            repo.save(e);
        }else{
            throw new RuntimeException("Employee Already Exists....");
        }
    }

    @Override
    public void UpdateEmployee(EmployeeDTO dto) {
        if (repo.existsById(dto.getId())) {
            Employee e = mapper.map(dto, Employee.class);
            repo.save(e);
        }else{
            throw new RuntimeException("No such Employee for update..!");
        }
    }

    @Override
    public EmployeeDTO searchEmployee(String id) {
        Optional<Employee> employee = repo.findById(id);
        if(employee.isPresent()){
            return mapper.map(employee.get(), EmployeeDTO.class);
        }else{
            throw new RuntimeException("No Employee for id: " + id);
        }
    }

    @Override
    public void deleteEmployee(String id) {
        if (repo.existsById(id)) {
            repo.deleteById(id);
        }else {
            throw new RuntimeException("No customer for : " + id);
        }

    }

    @Override
    public List<EmployeeDTO> getAllEmployee() {
       List<Employee> all = repo.findAll();
       return mapper.map(all, new TypeToken<List<EmployeeDTO>>(){
        }.getType());
    }
}
