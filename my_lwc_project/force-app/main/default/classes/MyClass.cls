public class MyClass {
    @AuraEnabled(cacheable=true)
    public static List<Map<String,Object>> getApiData() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:My_Named_Credential/dev/hello');
        req.setMethod('GET');
    
        Http http = new Http();
        HttpResponse res = http.send(req);
    
        if (res.getStatusCode() == 200) {
            Map<String, Object> responseBody = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            List<Object> listJson = (List<Object>) responseBody.get('list');
            List<Map<String,Object>> result = new List<Map<String,Object>>();
            for (Object obj : listJson) {
                result.add((Map<String,Object>) obj);
            }
            return result;
        } else {
            throw new CalloutException('Callout error');
        }
    }    
}
