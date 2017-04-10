Feature: Transaction

@mytag
Scenario: check data on successful transaction  
	Given I success do order transaction 
	When I arrive to successful trasaction page 
	Then I should see correct data for transaction 
	| TRX_ID    | ADDRESS_SHIP          | DATE_ORDER | SELLER_NAME | DELIVERY_SERVICE |
	| 01023A9AA | KAMPUNG DATOK KERAMAT | 21/08/2016 | FURHAN      | JNE              |
	| 01023A9AC | JALAN GURNEY          | 21/08/2016 | FURHAN      | REX              |
	| 01023A9AD | UTM KUALA LUMPUR      | 21/08/2016 | FURHAN      | POS              |

