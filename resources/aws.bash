##
# Amazon Web Services
##

# AWS CLI
if hash complete 2>/dev/null
then
  complete -C aws_completer aws
fi

# Elastic Beanstalk
export PATH=$PATH:/Users/joebalancio/projects/AWS-ElasticBeanstalk-CLI-2.6.3/eb/macosx/python2.7

