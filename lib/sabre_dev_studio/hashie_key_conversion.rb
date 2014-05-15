##
# NOTE: Hashie does not make it easy to write a custom KeyConversion.
# So here we are. :construction_worker: :arrow_heading_down:

##
# Reopen String to underscore the camel-cased strings. Miss you ActiveSupport.
module Underscore
  def underscore
    word = self.dup
    word.gsub!(/::/, '/')
    word.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
    word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
    word.tr!("-", "_")
    word.downcase!
    word
  end
end
String.send :include, Underscore

##
# Reopen Hash to lowercase the keys.
# Hashie does not have a KeyConversion for that
module KeyConversion
  def downcase_keys!
    keys.each do |k|
      downcase_keys_recursively!(self[k])
      self[k.to_s.underscore.downcase] = delete(k)
    end
    self
  end

  # Return a new hash with all keys converted
  # to downcase strings.
  def downcase_keys
    dup.downcase_keys!
  end

  protected

  # Downcase all keys recursively within nested
  # hashes and arrays.
  def downcase_keys_recursively!(object)
    if self.class === object
      object.downcase_keys!
    elsif ::Array === object
      object.each do |i|
        downcase_keys_recursively!(i)
      end
      object
    elsif object.respond_to?(:downcase_keys!)
      object.downcase_keys!
    else
      object
    end
  end
end
Hash.send :include, KeyConversion
