# ローカルにあるlambdaのソースコード
data "archive_file" "lambda_data" {
  type        = "zip"
  source_file = "${path.module}/lambda/lambda_test.py"
  output_path = "${path.module}/lambda/lambda_test.zip"
}

# AWSへ作るlambda function
resource "aws_lambda_function" "lambda_test" {
  depends_on       = [aws_iam_role.lambda_role]
  function_name    = "${var.env_prefix}-${var.service_name}-lambda_test"
  handler          = "lambda_test.handler"
  runtime          = "python3.9"
  role             = aws_iam_role.lambda_role.arn
  filename         = data.archive_file.lambda_data.output_path
  source_code_hash = data.archive_file.lambda_data.output_base64sha256
}
