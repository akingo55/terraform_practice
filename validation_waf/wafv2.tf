resource "aws_wafv2_web_acl" "waf_cloudfront" {
  name     = "cloudfront_waf_acl"
  scope    = "CLOUDFRONT"
  provider = aws.east

  default_action {
    allow {}
  }

  rule {
    name     = "cloudfront-waf-rule"
    priority = 1

    action {
      block {}
    }

    statement {
      rate_based_statement {
        limit              = 100
        aggregate_key_type = "IP"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "cloudfront-waf-rule"
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "cloudfront-waf"
    sampled_requests_enabled   = false
  }
}
