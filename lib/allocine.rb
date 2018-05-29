require 'date'
require 'digest'
require 'uri'
require 'rest-client'
require 'json'


class Allocine

  def initialize
    @api_host_name = 'api.allocine.fr'
    @api_base_path = '/rest/v3/'
    @api_partner = 'V2luZG93czg'
    @api_secret_key = 'e2b7fd293906435aa5dac4be670e7982'
    @img_base_url = 'http://images.allocine.fr'
    @user_agent = 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0; MSAppHost/1.0)'
  end

  def presets
    {
      global: {
        partner: @api_partner,
        format: 'json'
      },
      movielist: { profile: 'large' },
      movie: { profile: 'large' },
      tvserieslist: { filter: 'top', order: 'viewcount' },
      tvseries: { profile: 'large' },
      tvseriesbroadcastlist: { profile: 'large' },
      season: { profile: 'large' },
      seasonlist: { profile: 'small' },
      news: { profile: 'large' },
      newslist: { profile: 'large' },
      media: { mediafmt: 'mp4' },
      feature: { profile: 'large' },
      featurelist: { profile: 'large' },
      picturelist: { profile: 'large' },
      videolist: { mediafmt: 'mp4' },
      search: { filter: 'movie,tvseries,theater,news,video' }
    }
  end

  def api(method, options)
    url = "http://" + @api_host_name + build_path(method, options)
    response = RestClient.get(url, { user_agent: @user_agent }).body
    # return response
  end

  def build_path(route, params)
    path = @api_base_path + route.to_s;
    params = {}.merge(presets[:global])
               .merge(params)
    params.merge(presets[route.to_sym]) if presets[route.to_sym]

    if params
      tokens = []
      params.each do |k, v|
        tokens << k.to_s + "=" + encodeURI(v.to_s)
      end
      tokens.sort!

      path += "?" + tokens.join('&')

      sed = Date.today.strftime('%Y%m%d')
      sig = @api_secret_key + tokens.join('&') + '&sed=' + sed

      shasum = Digest::SHA1.new
      sig = hex_to_base64_digest(shasum.update(sig).hexdigest)

      sig_encoded = encodeURI(sig)

      return path +'&sed='+ sed +'&sig='+ sig_encoded
    end
  end

  private

  def hex_to_base64_digest(hexdigest)
    [[hexdigest].pack("H*")].pack("m0")
  end

  def encodeURI(str)
    URI.escape(str, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  end
end

