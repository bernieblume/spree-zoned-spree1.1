module Spree
  module Admin
    NavigationHelper.module_eval do

      def link_to_deletefc(resource, options = {}, html_options={})
        options.assert_valid_keys(:url, :caption, :title, :dataType, :success, :error, :name)

        options.reverse_merge! :url => object_url(resource) + '/zoneddfc' unless options.key? :url
        options.reverse_merge! :caption => t(:are_you_sure)
        options.reverse_merge! :title => t(:confirm_delete)
        options.reverse_merge! :dataType => 'script'
        options.reverse_merge! :success => "function(r){ $('##{spree_dom_id resource}').fadeOut('hide'); }"
        options.reverse_merge! :error => "function(jqXHR, textStatus, errorThrown){ show_flash_error(jqXHR.responseText); }"
        options.reverse_merge! :name => icon('delete') + ' ' + t(:deletefc)

        link_to_function_deletefc(options, html_options)
        #link_to_function_delete_native(options, html_options)
      end

      # this function does not use jConfirm
      def link_to_function_deletefc_native(options, html_options)
        fn = %Q{
          var answer = confirm("#{t(:are_you_sure)}");
          if (!!answer) { #{link_to_function_deletefc_ajax(options)} };
        }
        link_to_function options[:name], fn, html_options
      end

      def link_to_function_deletefc(options, html_options)
        link_to_function options[:name], "jConfirm('#{options[:caption]}', '#{options[:title]}', function(r) {
          if(r){ #{link_to_function_deletefc_ajax(options)} }
        });", html_options
      end

      def link_to_function_deletefc_ajax(options)
        %Q{
          $.ajax({
            type: 'POST',
            url: '#{options[:url]}',
            data: ({_method: 'delete', authenticity_token: AUTH_TOKEN}),
            dataType:'#{options[:dataType]}',
            success: #{options[:success]},
            error: #{options[:error]}
          });
        }
      end
      
    end
  end
end
