using {com.logaligroup as call} from '../db/schema';

service ServiceCatalog {
    entity Salesorder as projection on call.Salesorder;
}
