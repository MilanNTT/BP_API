using { Employee as Employee } from '../db/schema.cds';

service EmployeeService @(path: '/employee') {
    entity Employees as projection on Employee;
}