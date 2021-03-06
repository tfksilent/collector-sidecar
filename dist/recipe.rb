class GraylogSidecar < FPM::Cookery::Recipe
  description 'Graylog collector sidecar'

  name     'collector-sidecar'
  version  '0.0.9'
  revision '1'
  homepage 'https://graylog.org'
  arch     'amd64'

  source   "file:../../build/#{version}/linux/amd64/graylog-collector-sidecar"

  maintainer 'Graylog, Inc. <hello@graylog.org>'
  vendor     'graylog'
  license    'GPLv3'

  config_files '/etc/graylog/collector-sidecar/collector_sidecar.yml'

  def build
  end

  def install
    bin.install 'graylog-collector-sidecar'
    bin.install '../../collectors/filebeat/x86_64/filebeat'
    etc('graylog/collector-sidecar').install '../../../collector_sidecar.yml'
    etc('graylog/collector-sidecar/generated').mkdir
    var('log/graylog/collector-sidecar').mkdir
    var('run/graylog/collector-sidecar').mkdir
    var('spool/collector-sidecar/nxlog').mkdir
  end
end
