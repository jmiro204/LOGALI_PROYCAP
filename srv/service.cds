using {com.project as call} from '../db/schema';

service ServiceCatalog {
    entity Salesorder as projection on call.Salesorder;
    entity Items as projection on call.Items;
}
