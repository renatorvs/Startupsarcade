<?php
namespace app\payments;

use PagarMe\Client;

class Payments {

	public static function getToken() {
		return new Client('ak_test_OpOgiLk69LMaj2HqbnRva3ia3jUjMZ');
	}

	public static function executeCardCheckout($name, $number, $expMes, $expAno, $cvv) {
		$pagarme = self::getToken();

		$card = $pagarme->cards()->create([
			'holder_name' => $name,
			'number' => $number,
			'expiration_date' => $expMes . $expAno,
			'cvv' => $cvv,

		]);

		return $card;
	}

	public static function executeTransation($dadosEmpresa, $card, $nomeCliente, $plano, $planoValor, $parcelas) {
		$pagarme = self::getToken();

		return $pagarme->transactions()->create([

			'amount' => $planoValor,
			'card_id' => $card->id,
			'installments' => $parcelas,
			'payment_method' => 'credit_card',
			'postback_url' => 'http://requestb.in/pkt7pgpk',
			'customer' => [
				'external_id' => $dadosEmpresa[0]['emp_id'],
				'name' => $dadosEmpresa[0]['user_nome'],
				'email' => $dadosEmpresa[0]['user_email'],
				'type' => 'corporation',
				'country' => 'br',
				'documents' => [
					[
						'type' => 'cnpj',
						'number' => $dadosEmpresa[0]['emp_cnpj'],
					],
				],
				'phone_numbers' => '+55' . $dadosEmpresa[0]['uel_emp_contato'],
			],
			'billing' => [
				'name' => $nomeCliente,
				'address' => [
					'country' => 'br',
					'street' => $dadosEmpresa[0]['ender_logradouro'],
					'street_number' => $dadosEmpresa[0]['ender_numero'],
					'state' => $dadosEmpresa[0]['est_nome'],
					'city' => $dadosEmpresa[0]['ender_cidade'],
					'neighborhood' => $dadosEmpresa[0]['ender_bairro'],
					'zipcode' => $dadosEmpresa[0]['ender_cep'],
				],
			],

			'items' => [
				[
					'id' => '1',
					'title' => $plano,
					'unit_price' => $planoValor,
					'quantity' => 1,
					'tangible' => true,
				],

			],
		]);

	}

	public static function executeTransationBoleto($dadosEmpresa, $card, $nomeCliente, $plano, $planoValor, $parcelas) {

		$pagarme = self::getToken();

		return $pagarme->transactions()->create([

			$transaction = $pagarme->transactions()->create([
				'amount' => $planoValor,
				'payment_method' => 'boleto',
				'async' => false,
				'customer' => [
					'external_id' => '1',
					'name' => $nomeCliente,
					'type' => 'individual',
					'country' => 'br',
					'documents' => [
						[
							'type' => 'cnpj',
							'number' => $dadosEmpresa[0]['emp_cnpj'],
						]
					],
					'phone_numbers' => '+55' . $dadosEmpresa[0]['uel_emp_contato'],
					'email' => $dadosEmpresa[0]['user_email'],
				]
			]);


		}


	//RECEBE UMA NOTIFICAÇÃO DO PAGSEGURO
	//RETORNA UM OBJETO CONTENDO OS DADOS DO PAGAMENTO
		public function executeNotification($POST) {
			$url = $this->url_notificacao . $POST['notificationCode'] . $this->email_token;

			$curl = curl_init($url);
			curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

			$transaction = curl_exec($curl);
			if ($transaction == 'Unauthorized') {
			//TRANSAÇÃO NÃO AUTORIZADA

				exit;
			}
			curl_close($curl);
			$transaction_obj = simplexml_load_string($transaction);
			return $transaction_obj;
		}

	//Obtém o status de um pagamento com base no código do PagSeguro
	//Se o pagamento existir, retorna um código de 1 a 7
	//Se o pagamento não exitir, retorna NULL
		public function getStatusByCode($code) {

		}

	//Obtém o status de um pagamento com base na referência
	//Se o pagamento existir, retorna um código de 1 a 7
	//Se o pagamento não exitir, retorna NULL
		public function getStatusByReference($reference) {

		}

		public function getStatusText($code) {
			if ($code >= 1 && $code <= 7) {
				return $this->statusCode[$code];
			} else {
				return $this->statusCode[0];
			}

		}

	}
	?>