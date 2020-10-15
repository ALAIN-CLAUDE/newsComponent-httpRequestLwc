public with sharing class newsController {
    @AuraEnabled
    public static Map<string,Object> retriveNews() {
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b46fcef164c64af49e43dab0926a35bf');
        request.setMethod('GET');

        Map<string,Object> newsJsonData = new Map<string,Object>();

        string strResponse = null;

        try{
            Http http = new Http();
            HttpResponse response = http.send(request);
     
        if (response.getStatusCode() == 200) {
           
           strResponse =response.getBody();
        }
        else{
            throw new CalloutException(response.getBody());
        }
    } catch(Exception ex){
        throw ex;
    }

    if(!String.isBlank(strResponse)){
        newsJsonData =(Map<string,Object>)JSON.deserializeUntyped(strResponse);
    }
    if(!newsJsonData.isEmpty()){
        return newsJsonData;
    }
    else {
        return null;
    }
    }
}
