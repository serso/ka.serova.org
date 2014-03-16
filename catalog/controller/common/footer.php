<?php  
class ControllerCommonFooter extends Controller {
	protected function index() {
		$this->language->load('common/footer');

		$this->data['text_powered_by'] = sprintf($this->language->get('text_powered_by'), $this->config->get('config_name'), date('Y', time()));
        $this->data['text_contact'] = $this->language->get('text_contact');
        $this->data['text_about_us'] = $this->language->get('text_about_us');
        $this->data['text_shipping'] = $this->language->get('text_shipping');
        $this->data['text_footer'] = $this->language->get('text_footer');
        $this->data['text_connect'] = $this->language->get('text_connect');

        $this->data['contact'] = HTTP_SERVER . 'contacts';
        $this->data['about_us'] = HTTP_SERVER . 'about-us';
        $this->data['shipping'] = HTTP_SERVER . 'about-us#how-to-buy';

		$this->id = 'footer';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/footer.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/footer.tpl';
		} else {
			$this->template = 'default/template/common/footer.tpl';
		}
		
		if ($this->config->get('google_analytics_status')) {
			$this->data['google_analytics'] = html_entity_decode($this->config->get('google_analytics_code'), ENT_QUOTES, 'UTF-8');
		} else {
			$this->data['google_analytics'] = '';
		}
		
		$this->render();
	}
}
?>