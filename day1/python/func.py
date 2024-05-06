import json
import boto3
from datetime import datetime

def lambda_handler(event, context):
    # Initialize SES client
    ses_client = boto3.client('ses')
    # Email details
    SENDER = "shrouk.muhamedd@gmail.com"  
    
    RECIPIENT = "shrouk.muhamedd@gmail.com"
    SUBJECT = "Environment Configuration Change Detected"
    
    # Extract bucket name and object key from the event
    bucket_name = event['Records'][0]['s3']['bucket']['name']
    object_key = event['Records'][0]['s3']['object']['key']
    
    # Construct the email body
    BODY_TEXT = (f"Change detected in environment settings:\n\n"
                 f"Bucket: {bucket_name}\n"
                 f"File: {object_key}\n"
                 f"Timestamp: {datetime.now().isoformat()}")
    
    
    # Try to send the email.
    try:
        # Provide the contents of the email.
        response = ses_client.send_email(
            Destination={
                'ToAddresses': [
                    RECIPIENT,
                ],
            },
            Message={
                'Body': {
                    'Text': {
                        'Charset': "UTF-8",
                        'Data': BODY_TEXT,
                    },
                },
                'Subject': {
                    'Charset': "UTF-8",
                    'Data': SUBJECT,
                },
            },
            Source=SENDER,
        )
    except Exception as e:
        print(e)
        print('Error sending email')
        raise e
    else:
        print("Email sent! Message ID:"),
        print(response['MessageId'])

    return {
        'statusCode': 200,
        'body': json.dumps('Email sent successfully!')
    }
