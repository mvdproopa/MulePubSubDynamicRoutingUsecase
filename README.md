# MulePubSubDynamicRoutingUsecase

This usecase is to consume a message from an exisitng legacy queue, Transform input to preferred target structure and send it to target system by selecting target connection/transformation details dynamically during runtime. 

Main Goal:
 - In future state if there is any need to add new Target, the changes should be minimal in the project level (updating property file with new vendor and adding new vendor dwl file).
 - Message reliability
 - Message reconnection

FLow-1:
1. Consume message from a Queue. 
2. Validate the message for VendorName. 
3. If the validation is successful, publish the paylaod to Topic.
4. If the validation is not successful, flow raises an error.

FLow-2:
5. Another flow listens to the Topic.
6. Based on the vendor name, flow will transform input paylaod to the required output structure dynamically by using dynamic evaluate.
7. After Successful transformation, flow will call Flow-3 by using paylaod.
8. Response from the Flow-3 is published to Response Queue.

FLow-3:
9. Based on the Vendor Transport Type [supports for Http & FTP(used file to showcase the functionality)], It will send payload to target system by dynamically by getting target details from property file.
10. If the paylaod is successfully delivered to Target, SUCCESS status response is sent back to FLow-2.
11. If there are any failures, Failure status message is sent back to FLow-2.

Current implementation supports http & FTP (used file for showcasing).
