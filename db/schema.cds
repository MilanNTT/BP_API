namespace BP_API;

using { cuid } from '@sap/cds/common';

entity Employee : cuid {
    name : String(100);
    surname: String(100);
    email: String(100);
    bornOn : Date;
}