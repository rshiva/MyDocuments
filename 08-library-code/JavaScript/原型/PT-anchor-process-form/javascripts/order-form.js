var _orderForm = {
	
	// Pricing for products
	pricing: {
		
		// Operating systems
		'operating-systems': {
			'Debian':  0,
			'CentOS':  0,
			'Red Hat': 75,
			'Windows': {
				callback: '_pricing_windows',
				args: [35, 70] // First value for VPS A-G, second for VPS H & I
			}
		},
		
		// Support packs
		'support-packs': {
			'Monitor': {
				cost:  0,
				setup: 0
			},
			'Secure': {
				cost:  100,
				setup: 100
			},
			'Complete': {
				cost:  400,
				setup: 400
			}
		},
		
		// Secure port
		'secure-port': {
			'None': {
				cost:  0,
				setup: 0
			},
			'Shared': {
				cost:  55,
				setup: 137.5
			},
			'Private': {
				cost:  137.5,
				setup: 275
			}
		},
		
		'backups': {
			'Online Disk': {
				cost:  0,
				setup: 137.5
			},
			'Offsite Tapes': {
				cost:  0,
				setup: 137.5
			}
		}
	},
	
	pricingGroups: {
		vps:           ['vps'],
		customisation: ['operating-systems', 'support-packs'],
		extras:        ['backups', 'secure-port', 'required-packages']
	},
	
	vpsFallback: {
		a: {
			ram: '512 MB',
			storage: '10 GB',
			storageGB: 10,
			allowance: '10 GB',
			cost: 80,
			setup: 80,
			hoverText: "This VPS does not have enough disk space for Windows"
		},
		b: {
			ram: '1 GB',
			storage: '15 GB',
			storageGB: 15,
			allowance: '15 GB',
			cost: 120,
			setup: 120,
			hoverText: "This VPS does not have enough disk space for Windows"
		},
		c: {
			ram: '1.5 GB',
			storage: '20 GB',
			storageGB: 20,
			allowance: '20 GB',
			cost: 160,
			setup: 160
		},
		d: {
			ram: '2 GB',
			storage: '40 GB',
			storageGB: 40,
			allowance: '30 GB',
			cost: 195,
			setup: 195
		},
		e: {
			ram: '3 GB',
			storage: '60 GB',
			storageGB: 60,
			allowance: '40 GB',
			cost: 295,
			setup: 295
		},
		f: {
			ram: '4 GB',
			storage: '80 GB',
			storageGB: 80,
			allowance: '50 GB',
			cost: 390,
			setup: 390
		},
		g: {
			ram: '8 GB',
			storage: '120 GB',
			storageGB: 120,
			allowance: '100 GB',
			cost: 585,
			setup: 585
		},
		h: {
			ram: '12 GB',
			storage: '160 GB',
			storageGB: 160,
			allowance: '150 GB',
			cost: 775,
			setup: 775
		},
		i: {
			ram: '16 GB',
			storage: '200 GB',
			storageGB: 200,
			allowance: '200 GB',
			cost: 960,
			setup: 960
		}
	},
	
	
	// Enabling and disabling logic
	products: {
		'vps': {
			ab: {
				values: ['a', 'b'],
				disable: {
					'operating-systems': ['Windows']
				},
				reset: true
			},
			others: {
				values: $R('c', 'i'),
				enable: {
					'operating-systems': ['Windows']
				},
				reset: true
			}
		},
		'operating-systems': {
			windows: {
				values: ['Windows'],
				disable: {
					'required-packages': ['Apache', 'nginx', 'MySQL', 'PostgreSQL']
				},
				reset: true
			},
			linux: {
				values: ['Debian', 'CentOS', 'Red Hat'],
				disable: {
					'required-packages': ['IIS', 'MSSQL']
				},
				reset: true
			}
		},
		'required-packages': {
			postgresql: {
				values: ['PostgreSQL'],
				disable: {
					'required-packages': ['MySQL']
				}
			},
			mysql: {
				values: ['MySQL'],
				disable: {
					'required-packages': ['PostgreSQL']
				}
			},
			apache: {
				values: ['Apache'],
				disable: {
					'required-packages': ['nginx']
				}
			},
			nginx: {
				values: ['nginx'],
				disable: {
					'required-packages': ['Apache']
				}
			}
		}
	}
};



function buildVPS(vpsObj)
{
	var vps = vpsObj;
	if (!vps || Object.isUndefined(vps) || vps == { }) {
		vps = _orderForm.vpsFallback;
	}
	
	var vpsList = $('vps').down('ul.radios');
	var template = vpsList.down('li');
	
	// Initialise pricing for VPS
	if (Object.isUndefined(_orderForm.pricing.vps)) {
		_orderForm.pricing.vps = {};
	}
	
	// Add the VPS object to the order form object
	_orderForm.vps = vps;
	
	// An array of VPS which allow windows
	var enableVPS = [];
	
	$H(vps).each(function(v) {
		
		// Clone the template
		var li = template.clone(true);
		// Set the value of the radio
		li.down('input[type="radio"]').writeAttribute('value', v.key);
		// Update details
		li.down('span.title').update('VPS ' + v.key.toUpperCase());
		li.down('span.ram').update(v.value.ram || '&nbsp;');
		li.down('span.storage').update(v.value.storage || '&nbsp;');
		li.down('span.allowance').update(v.value.allowance || '&nbsp;');
		var cost = (v.value.cost) ? '$' + v.value.cost + ' per month' : '&nbsp;';
		li.down('span.cost').update(cost);
		// Insert the VPS
		vpsList.insert(li);
		
		if (v.value.hoverText) {
			li.down('label').addClassName('hovertip');
			var hover = new Element('p', { className: 'hovertip' }).insert(
				new Element('span', { className: 'wrapper' }).insert(
					'<span class="text">' + v.value.hoverText + '</span>'
				).insert(
					new Element('img', { src: 'images/order-form/tooltip-arrow-side.png', alt: '', className: 'arrow' })
				)
			);
			li.down('label').insert(hover);
		}
		
		// Set the pricing of the vps
		_orderForm.pricing.vps[v.key] = {
			cost:  v.value.cost || 0,
			setup: v.value.setup || 0
		};
		
		if (v.key != 'a' && v.key != 'b') {
			enableVPS.push(v.key);
		}
		
	});
	
	if (!Object.isUndefined(_orderForm.products.vps.others)) {
		_orderForm.products.vps.others.values = enableVPS;
	}
	
	// Remove the template
	template.remove();
	
}




var OrderForm = Class.create({
	
	initialize: function(form, progress, overviewHeader, overviewFooter)
	{
		this.form = $(form);
		
		// Set options
		this.options = Object.extend({
			priceContainer:     '.summary .costing',
			tooltipMove:        30,
			tooltipSelector:    'a[href="#tooltip"]',
			togglerSelector:    '.toggler',
			addAnotherSelector: '.add-another',
			addAnotherClonee:   'ul li',
			addAnotherLink:     'a[href="#add-another"]',
			validationSelector: '.validate',
			callbackSelector:   '.callback'
		}, arguments[4] || { });
		
		// Form
		this.form.observe('submit', this.form_submit.bind(this));
		
		// Flag whether the form can submit
		this.canSubmit = false;
		
		// Fieldsets
		this.wrapper      = this.form.down('.fieldset-wrapper');
		this.fieldsets    = this.form.select('fieldset');
		this.confirmation = this.fieldsets.last();
		this.current = 0;
		
		// Just for debug
		if (this.current > 0) {
			this.fieldsets[0].hide();
			this.fieldsets[this.current].show();
		}
		
		// Pricings
		var currentFieldset = this.fieldsets[this.current];
		this.pricing_positionPricingForFieldset(currentFieldset);
		
		// Setup the pricing
		this.pricingOverviewHeader = $(overviewHeader);
		this.pricingOverviewFooter = $(overviewFooter)
		if (_orderForm.pricing) {
			this.pricing       = _orderForm.pricing;
			this.pricingGroups = _orderForm.pricingGroups;
			this.pricing_setup();
		}
		
		// Progress
		this.progress = $(progress);
		this.progressList = this.progress.down('ol');
		this.progressMercury = this.progress.down('.mercury');
		
		// Navigation
		this.nextButton = this.form.down('.navigation .next');
		this.backButton = this.form.down('.navigation .back');
		this.nextButton.observe('click', this.navigation_next_click.bind(this));
		this.backButton.observe('click', this.navigation_back_click.bind(this));
		
		// Products
		this.product_observe(_orderForm.products);
		
		// Tooltips
		var tooltips = this.form.select(this.options.tooltipSelector);
		tooltips.invoke('observe', 'mouseover', this.tooltip_mouseover.bind(this));
		tooltips.invoke('observe', 'mouseout', this.tooltip_mouseout.bind(this));
		tooltips.invoke('observe', 'click', function(event) { event.stop(); });
		
		// Togglers
		var togglers = this.form.select(this.options.togglerSelector);
		togglers.invoke('observe', 'click', this.toggler_click.bind(this));
		
		// Add another
		var addAnothers = this.form.select(this.options.addAnotherSelector);
		addAnothers.invoke('down', this.options.addAnotherLink).invoke(
			'observe', 'click', this.addAnother_click.bind(this)
		);
		
		// Callbacks
		var callbacks = this.form.select(this.options.callbackSelector);
		callbacks.invoke('observe', 'click', this.callback_click.bind(this));
	},
	
	form_submit: function(event)
	{
		event.stop();
		if (this.canSubmit) {
			this.form.submit();
		} else {
			this.navigation_next();
		}
	},
	
	navigation_set: function(number, validate)
	{
		if (!Object.isNumber(number) || number == this.current) {
			return false;
		}
		
		var currentFieldset = this.fieldsets[this.current];
		
		// Validate the current field
		if (validate) {
			var valid = this.navigation_validate(currentFieldset);
			if (!valid) {
				var errorMessage = currentFieldset.down('.error-message');
				if (errorMessage) {
					var field = errorMessage.up('.field');
					if (field) {
						var scrollTo = field;
					} else {
						var scrollTo = errorMessage;
					}
					new Effect.ScrollTo(scrollTo, { duration: 0.2, offset: -30 });
				}
				return false;
			}
		}
		
		this.navigation_summarise(currentFieldset);
		
		var newFieldset = this.fieldsets[number];
		if (!newFieldset) return false;
		
		var currentHeight = currentFieldset.measure('margin-box-height');
		var newHeight = newFieldset.measure('margin-box-height');
		
		this.wrapper.setStyle({ height: currentHeight + 'px' });
		
		// Get the next progress element
		var currentProgress = this.navigation_getProgressElement(currentFieldset);
		var newProgress     = this.navigation_getProgressElement(newFieldset);
		
		var newDistance = this.navigation_getProgressDistance(newProgress);
		
		this.navigation_setProgressStatus(currentProgress, 'complete');
		this.navigation_setProgressStatus(newProgress, 'current');
		
		var fieldset_queue = {
			position: 'end',
			scope: 'vps_fieldset'
		};
		
		// Scroll to the top of the form
		new Effect.ScrollTo(this.form, {
			offset: -100,
			duration: 0.3,
			queue: fieldset_queue
		});
		
		new Effect.Parallel([
			new Effect.Morph(this.progressMercury, {
				sync: true,
				style: { width: newDistance + 'px' }
			}),
			new Effect.Appear(newProgress.down('.status'), { sync: true }),
			new Effect.Fade(currentFieldset, { sync: true }),
			
		], {
			duration: 0.5,
			queue: fieldset_queue
		});
		
		new Effect.Morph(this.wrapper, {
			style: { height: newHeight + 'px' },
			duration: 0.5,
			queue: fieldset_queue
		});
		new Effect.Appear(newFieldset, {
			duration: 0.5,
			queue: fieldset_queue,
			afterFinish: function()
			{
				this.wrapper.setStyle({ height: 'auto' });
				this.pricing_positionPricingForFieldset(newFieldset);
			}.bind(this)
		});
		this.current = number;
		
		if (this.current >= this.fieldsets.length - 1) {
			new Effect.BlindDown(this.pricingOverviewFooter, {
				duration: 0.2,
				queue: fieldset_queue,
				afterFinish: function()
				{
					this.canSubmit = true;
					this.nextButton.hide();
				}.bind(this)
			});
		} else {
			this.nextButton.show();
			this.canSubmit = false;
			if (this.pricingOverviewFooter.visible()) {
				new Effect.BlindUp(this.pricingOverviewFooter, {
					duration: 0.2,
					queue: fieldset_queue
				});
			}
		}
	},
	
	navigation_validate: function(fieldset)
	{
		var validationFields = fieldset.select(this.options.validationSelector);
		var valid = true;
		
		fieldset.select('.error-message').invoke('remove');
		fieldset.select('.error-field').invoke('removeClassName', 'error-field');
		fieldset.select('input.error, textarea.error, select.error').invoke('removeClassName', 'error');
		
		validationFields.each(function(field) {
			
			if (!this._isDisplayed(field)) {
				return false;
			}
			
			var types = this._getClassAttribute(field, 'validate');
			if (Object.isString(types)) {
				types = [types];
			}
			
			types.each(function(type) {
				var callback = 'validate_' + type;
				var result = this[callback](field);
				if (!result) {
					valid = false;
					throw $break;
				}
			}, this);
			
		}, this);
		return valid;
	},
	
	navigation_summarise: function(fieldset)
	{
		var formElements = Form.getElements(fieldset);
		var serialized   = this._serializeElements(formElements, true);
		
		var expiryMonth;
		
		$H(serialized).each(function(serial) {
			
			switch (serial.key) {
				
				case 'vps':
					// Get the associated vps
					var value = serial.value;
					var vps_data = $H(_orderForm.vps).get(value);
					$H(vps_data).each(function(v_data) {
						this.navigation_setConfirmation(serial.key + '-' + v_data.key, v_data.value);
					}, this);
					break;
				
				case 'payment-type':
					var value = serial.value;
					if (value == 'Credit Card') {
						this.confirmation.select('.credit-card').invoke('show');
					} else {
						this.confirmation.select('.credit-card').invoke('hide');
					}
					this.navigation_setConfirmation('payment-type', value);
					break;
				
				case 'backups':
					if (Object.isArray(serial.value)) {
						var value = serial.value;
					} else {
						var value = [serial.value];
					}
					var display = value.collect(function(_v) {
						if (_v == 'Online Disk') {
							return _v + ' <span class="price"><span>&mdash;</span> $3/GB per month</span>';
						} else {
							return _v + ' <span class="price"><span>&mdash;</span> $13.75/GB per month</span>';
						}
					});
					var display = display.join('<br />');
					this.navigation_setConfirmation('backups', display);
					break;
				
				case 'card-number':
					// Set the card number
					var value = serial.value;
					value = value.replace(/[^\d]/g, '');
					var lastFour = value.substr(value.length - 4);
					this.navigation_setConfirmation(serial.key, 'XXXX XXXX XXXX ' + lastFour);
					
					// Set the card type
					var cardType = (parseInt(value.substring(0, 1), 10) == 4) ? 'Visa' : 'Mastercard';
					this.navigation_setConfirmation('card-type', cardType);
					break;
				
				case 'required-packages':
					var confirmation = this.confirmation.down('.' + serial.key);
					if (confirmation) {
						confirmation.update();
						if (Object.isString(serial.value)) {
							serial.value = [serial.value];
						}
						var last;
						serial.value.each(function(v) {
							last = new Element('li').insert(v);
							confirmation.insert(last);
						});
						last.addClassName('last');
					}
					break;
				
				case 'expiry-month':
				case 'expiry-year':
					if (serial.key == 'expiry-month') {
						expiryMonth = serial.value;
						return;
					}
					var value = serial.value;
					var expiryYear = value.substr(value.length - 2);
					this.navigation_setConfirmation('card-expiry', expiryMonth + ' / ' + expiryYear);
					break;
				
				default:
					this.navigation_setConfirmation(serial.key, serial.value);
					break;
				
			}
			
			
		}, this);
	},
	
	navigation_setConfirmation: function(key, value)
	{
		var confirmation = this.confirmation.down('.' + key);
		if (confirmation) {
			confirmation.update(value);
		}
	},
	
	navigation_setProgressStatus: function(progress, status)
	{
		if (!progress) return false;
		var progressLi = progress.up('li');
		progressLi.removeClassName('complete');
		progressLi.removeClassName('current');
		progressLi.addClassName(status);
	},
	
	// Gets the progress element associated with a fieldset
	navigation_getProgressElement: function(fieldset)
	{
		if (!fieldset) return false;
		var id = fieldset.readAttribute('id');
		if (!id) return false;
		
		var progress = this.progressList.down('a[rel="' + id + '"]');
		return progress;
	},
	
	navigation_getProgressDistance: function(progress)
	{
		if (!progress) return false;
		
		var progressLi = progress.up('li');
		
		var width = 0;
		if (!progressLi.hasClassName('first')) {
			this.progressList.select('li').each(function(li) {
				if (progressLi == li && !progressLi.hasClassName('last')) {
					width += li.measure('width') / 2;
					throw $break;
				}
				width += li.measure('width');
			});
			width -= 10;
		}
		return Math.round(width);
	},
	
	navigation_next: function()
	{
		var next = this.current + 1;
		if (next > this.fieldsets.size()) {
			return false;
		}
		this.navigation_set(next, true);
	},
	navigation_next_click: function(event)
	{
		event.stop();
		this.navigation_next();
	},
	
	navigation_back: function()
	{
		var prev = this.current - 1;
		if (prev < 0) {
			return false;
		}
		this.navigation_set(prev);
	},
	navigation_back_click: function(event)
	{
		event.stop();
		this.navigation_back();
	},
	
	pricing_positionPricingForFieldset: function(fieldset)
	{
		var pricings = fieldset.select(this.options.priceContainer);
		if (!pricings) return false;
		
		pricings.each(function(pricing) {
			this.pricing_positionPricing(pricing);
		}, this);
	},
	
	pricing_positionPricing: function(pricing)
	{
		var container = pricing.up('.field');
		var containerHeight = container.measure('height');
		var pricingHeight   = pricing.measure('height');
		
		var offset = Math.round(containerHeight / 2 - pricingHeight / 2);
		pricing.setStyle({ paddingTop: offset + 'px' });
		
		new Effect.Appear(pricing, { duration: 0.3 });
	},
	
	pricing_setup: function()
	{
		if (!this.pricing) return false;
		
		// This tallies everything up
		this.total_fields  = $H();
		this.total_setup   = $H();
		this.total_ongoing = $H();
		
		$H(this.pricing).each(function(pricing) {
			
			// Get the container
			var container_key = pricing.key;
			var container = $(container_key);
			if (!container) {
				return false;
			}
			
			// Get the pricing group
			var group = this.pricing_getGroup(container_key);
			
			var values = pricing.value;
			$H(values).each(function(pricing_data) {
				
				var input = container.down('*[value="' + pricing_data.key + '"]');
				var label = input.up('label');
				
				label.observe('click', function(event)
				{
					// Ignore Fancy Box hidden events
					if (event.element().hasClassName('fb_hidden')) {
						return false;
					}
					if (label.hasClassName('disabled')) {
						return false;
					}
					
					var store_key = container_key;
					var _container_key = container_key;
					if (label.hasClassName('checkbox')) {
						store_key = pricing_data.key;
						_container_key = container_key + '_' + pricing_data.key
					}
					
					var _pricing_data = pricing_data.value;
					
					if (typeof _pricing_data == 'object') {
						
						// Custom callbacks
						if (Object.isString(_pricing_data.callback)) {
							_pricing_data = this[_pricing_data.callback](_pricing_data.args);
						}
						var cost, setup;
						if (label.hasClassName('checkbox') && input.checked) {
							cost  = 0;
							setup = 0;
						} else {
							cost  = _pricing_data.cost;
							setup = _pricing_data.setup;
						}
						this.pricing_setPrice(label, cost, store_key);
						this.pricing_setGroupPrice(group, cost,  _container_key);
						this.pricing_setGroupPrice(group, setup, _container_key, true);
					} else {
						if (label.hasClassName('checkbox') && input.checked) {
							_pricing_data = 0;
						}
						this.pricing_setPrice(label, _pricing_data, store_key);
						this.pricing_setGroupPrice(group, _pricing_data, _container_key);
					}
					
					this.pricing_calculateTotal();
					this.pricing_calculateMonthly();
					
				}.bind(this));
				
			}, this);
			
		}, this);
	},
	
	// Gets a pricing containers group
	pricing_getGroup: function(id)
	{
		if (!this.pricingGroups) return false;
		var group = false;
		$H(this.pricingGroups).each(function(g) {
			if (g.value.indexOf(id) > -1) {
				group = g.key;
				throw $break;
			}
		});
		return group;
	},
	
	pricing_setGroupPrice: function(group, price, key, setup)
	{
		var className, hashName;
		if (setup) {
			className = 'setup';
			group     = 'setup';
			hashName  = 'total_setup';
		} else {
			className = group;
			hashName  = 'total_ongoing';
		}
		
		var total = this[hashName].get(group);
		
		if (!total) total = $H();
		total.set(key, price);
		
		this[hashName].set(group, total);
		
		var _total = 0;
		total.each(function(t) {
			_total += t.value;
		});
		
		var overview = this.pricingOverviewHeader.down('.' + className);
		this.pricing_updatePrice(overview, _total);
	},
	
	pricing_setPrice: function(field, price, key)
	{
		var pricing = this.pricing_getElement(field);
		var total   = pricing.retrieve('total') || $H();
		total.set(key, price);
		pricing.store('total', total);
		
		_total = 0;
		total.each(function(i) {
			_total += i.value;
		});
		this.pricing_updatePrice(pricing, _total);
	},
	
	pricing_updatePrice: function(element, price)
	{
		if (!element.match('.amount')) {
			element = element.down('.price .amount');
		}
		
		var splitPrice = this._splitPrice(price);
		
		element.update('<span class="dollars">' + splitPrice.dollars + '</span>');
		if (splitPrice.cents > 0) {
			element.insert('<span class="cents">.' + splitPrice.cents + '</span>');
		}
	},
	
	pricing_getElement: function(element)
	{
		if (!element) return false;
		
		var field = element.up('.field');
		return field.down(this.options.priceContainer);
	},
	
	pricing_calculateTotal: function()
	{
		var setup   = this.pricing_getTotal(this.total_setup);
		var ongoing = this.pricing_getTotal(this.total_ongoing);
		var total = setup + ongoing;
		var header = this.pricingOverviewHeader.down('.pricing.total');
		var footer = this.pricingOverviewFooter.down('.pricing.total');
		this.pricing_updatePrice(header, total);
		this.pricing_updatePrice(footer, total);
	},
	
	pricing_calculateMonthly: function()
	{
		var total = this.pricing_getTotal(this.total_ongoing);
		this.pricing_updatePrice(this.pricingOverviewHeader.down('.next-month .total .amount'), total);
		this.pricing_updatePrice(this.pricingOverviewFooter.down('.next-month .total .amount'), total);
	},
	
	pricing_getTotal: function(hash)
	{
		var total = 0;
		$H(hash).each(function(i) {
			$H(i.value).each(function(j) {
				total += j.value;
			})
		});
		return total;
	},
	
	product_observe: function(products)
	{
		$H(products).each(function(product) {
			var container = $(product.key);
			$H(product.value).each(function(productInfo) {
				var associatedValues = productInfo.value.values;
				associatedValues.each(function(associatedValue) {
					var input = container.down('input[value="' + associatedValue + '"]');
					if (input) {
						var label = input.up('label');
						if (productInfo.value.disable) {
							var disable = productInfo.value.disable;
							label.observe('click', this.product_disableClick.bindAsEventListener(this, input, disable, {
								reset: productInfo.value.reset
							}));
						} else if (productInfo.value.enable) {
							var enable = productInfo.value.enable;
							label.observe('click', this.product_enableClick.bindAsEventListener(this, input, enable, {
								reset: productInfo.value.reset
							}));
						}
					}
				}, this);
			}, this);
		}, this);
	},
	
	product_isDisabled: function(element)
	{
		var element = $(element);
		if (!element) return false;
		
		if (!element.match('label')) {
			element = element.up('label');
		}
		
		return element.hasClassName('disabled');
	},
	
	product_enable: function(input)
	{
		var input = $(input);
		if (!input) return false;
		
		var label = input.up('label');
		if (!label) return false;
		
		if (label.hasClassName('disabled')) {
			label.removeClassName('disabled');
		}
	},
	
	product_disable: function(input)
	{
		var input = $(input);
		if (!input) return false;
		
		var label = input.up('label');
		if (!label) return false;
		
		if (!label.hasClassName('disabled')) {
			label.addClassName('disabled');
		}
	},
	
	product_enableClick: function(event, input, actions, options)
	{
		// Ignore Fancy Box hidden events
		if (event.element().hasClassName('fb_hidden')) {
			return false;
		}
		var label = event.findElement('label');
		if (this.product_isDisabled(label)) {
			return false;
		}
		
		this.product_setActions(actions, Object.extend({
			mode: (input.checked) ? 'disable' : 'enable'
		}, options || { }));
	},
	
	product_disableClick: function(event, input, actions, options)
	{
		// Ignore Fancy Box hidden events
		if (event.element().hasClassName('fb_hidden')) {
			return false;
		}
		var label = event.findElement('label');
		if (this.product_isDisabled(label)) {
			return false;
		}
		
		this.product_setActions(actions, Object.extend({
			mode: (input.checked) ? 'enable' : 'disable'
		}, options || { }));
	},
	
	product_setActions: function(actions, options)
	{
		var options = Object.extend({
			reset:  false,
			enable: false,
			mode:   'disable'
		}, options || { });
		
		$H(actions).each(function(action) {
			var container = $(action.key);
			if (options.reset) {
				container.select('label.disabled').invoke('removeClassName', 'disabled');
			}
			action.value.each(function(value) {
				var input = container.down('*[value="' + value + '"]');
				this['product_' + options.mode](input);
			}, this);
		}, this);
	},
	
	tooltip_mouseover: function(event)
	{
		var link = event.findElement('a');
		var message = this.tooltip_getMessage(link);
		
		if (!message) return false;
		
		if (!message.retrieve('positioned')) {
			this.tooltip_positionMessage(link, message);
		}
		
		var tooltipDelay = (function() { this.tooltip_show(message); }.bind(this)).delay(0.2);
		link.store('tooltipDelay', tooltipDelay);
	},
	
	tooltip_show: function(message)
	{
		new Effect.Parallel([
			new Effect.Appear(message, { sync: true }),
			new Effect.Morph(message, {
				sync: true,
				style: {
					top: (parseInt(message.getStyle('top'), 10) + this.options.tooltipMove) + 'px'
				}
			})
		], {
			duration: 0.3,
			queue: {
				position: 'end',
				scope: 'vps_tooltip'
			}
		});
	},
	
	tooltip_mouseout: function(event)
	{
		var link = event.findElement('a');
		var message = this.tooltip_getMessage(link);
		
		if (!message) return false;
		
		// Clear any delays
		if (link.retrieve('tooltipDelay')) {
			window.clearTimeout(link.retrieve('tooltipDelay'));
			link.store('tooltipDelay', false);
		}
		
		new Effect.Parallel([
			new Effect.Fade(message, { sync: true }),
			new Effect.Morph(message, {
				sync: true,
				style: {
					top: (parseInt(message.getStyle('top'), 10) - this.options.tooltipMove) + 'px'
				}
			})
		], {
			duration: 0.3,
			queue: {
				position: 'end',
				scope: 'vps_tooltip'
			}
		});
	},
	
	tooltip_getMessage: function(link)
	{
		if (!link) return false;
		
		var message = link.next('.tooltip-content');
		if (!message) return false;
		
		return message;
	},
	
	tooltip_positionMessage: function(link, message)
	{
		var linkPos   = link.positionedOffset();
		var linkWidth = link.getWidth();
		var linkPoint = Math.round(linkPos.left + (linkWidth / 2));
		
		var messageDims   = message.getLayout();
		var messageOffset = messageDims.get('width') / 2;
		
		var arrow = message.down('img.arrow');
		var arrowHeight = 0;
		if (arrow) {
			message.show();
			var arrowWidth  = arrow.measure('width');
			arrowHeight = arrow.measure('height');
			var arrowPos = Math.round(messageOffset - arrowWidth / 2);
			arrow.setStyle({ left: (arrowPos - 2) + 'px' });
			message.hide();
		}
		
		message.setStyle({
			left: (linkPoint - messageOffset) + 'px',
			top:  (linkPos.top - messageDims.get('height') - arrowHeight - this.options.tooltipMove) + 'px'
		});
		message.store('position', true);
	},
	
	toggler_click: function(event)
	{
		// Ignore Fancy Box hidden events
		if (event.element().hasClassName('fb_hidden')) {
			return false;
		}
		
		var element = event.findElement(this.options.togglerSelector);
		if (element.hasClassName('disabled')) {
			return false;
		}
		
		var connections = element.retrieve('connections');
		if (connections == '__empty') {
			return false;
		} else if (!connections) {
			var rel = this._getClassAttribute(element, 'rel');
			if (rel) {
				if (!Object.isArray(rel)) {
					rel = [rel];
				}
				connections = rel.collect(function(r) { return $(r); });
			}
			if (!connections) {
				element.store('connections', '__empty');
				return false;
			}
			element.store('connections', connections);
			connections.each(function(c) {
				if (c.visible()) {
					c.store('open', true);
				}
			});
		}
		
		connections.each(function(connection) {
			if (connection.retrieve('open')) {
				if (element.hasClassName('opener')) {
					return false;
				}
				new Effect.BlindUp(connection, {
					duration: 0.3,
					queue: {
						position: 'end',
						scope: 'vps_toggler'
					}
				});
				connection.store('open', false);
			} else {
				if (element.hasClassName('closer')) {
					return false;
				}
				new Effect.BlindDown(connection, {
					duration: 0.3,
					queue: {
						position: 'end',
						scope: 'vps_toggler'
					}
				});
				connection.store('open', true);
			}
		});
	},
	
	addAnother_click: function(event)
	{
		event.stop();
		
		var container = event.findElement(this.options.addAnotherSelector);
		var clonee = container.down(this.options.addAnotherClonee);
		var link   = container.down(this.options.addAnotherLink);
		
		var counter = container.retrieve('count');
		if (!counter) {
			counter = 1;
		}
		counter++;
		container.store('count', counter);
		
		var cloned = clonee.clone(true);
		cloned.hide();
		clonee.up().insert(cloned);
		
		var effects = [];
		
		if (counter >= 5) {
			effects.push(new Effect.BlindUp(link, { sync: true }));
		}
		effects.push(new Effect.BlindDown(cloned, { sync: true}));
		new Effect.Parallel(effects, { duration: 0.3 });
	},
	
	callback_click: function(event)
	{
		// Ignore Fancy Box hidden events
		if (event.element().hasClassName('fb_hidden')) {
			return false;
		}
		var label = event.findElement('label');
		if (label.hasClassName('disabled')) {
			return false;
		}
		
		
		var callback = this._getClassAttribute(label, 'callback');
		if (callback && this[callback]) {
			this[callback](label);
		}
	},
	
	validate_required: function(field)
	{
		var input   = field.down('input, textarea');
		var type    = input.readAttribute('type');
		var tagName = input.tagName.toLowerCase();
		
		var value = $F(input).strip();
		if (value) {
			return true;
		} else {
			var error = this._buildError('This is a required field.');
			input.addClassName('error');
			input.insert({ after: error });
			new Effect.BlindDown(error, { duration: 0.3 });
			return false;
		}
	},
	
	validate_int: function(field)
	{
		var input = field.down('input');
		var value = $F(input).strip();
		if (value) {
			var result = /\d+/.test(value);
			if (result) {
				return true;
			} else {
				var error = this._buildError('Please use numbers only in this field.');
				input.up('.field-input').addClassName('error-field').insert(error);
				new Effect.BlindDown(error, { duration: 0.3 });
				return false;
			}
		} else {
			return true;
		}
	},
	
	validate_selectOne: function(field)
	{
		var inputs = field.select('input[type="radio"], input[type="checkbox"]');
		var find = inputs.detect(function(input) {
			return input.checked;
		});
		if (!find) {
			var error = this._buildError('Please select an option.');
			if (field.match('.field-contents')) {
				field.insert({ top: error });
			} else {
				field.down('.field-contents').insert({ top: error });
			}
			new Effect.BlindDown(error, { duration: 0.3 });
			return false;
		} else {
			return true;
		}
	},
	
	validate_requireAll: function(field)
	{
		var inputs = field.select('input, textarea, select');
		var empty  = inputs.reject(function(input) {
			var value = $F(input).strip();
			if (!value || value == '') {
				return false;
			}
			return true;
		});
		
		if (empty.size() > 0) {
			
			empty.invoke('addClassName', 'error');
			
			var error = this._buildError('The highlighted fields are required.');
			if (field.match('.field-contents')) {
				field.insert({ top: error });
			} else {
				field.down('.field-contents').insert({ top: error });
			}
			new Effect.BlindDown(error, { duration: 0.3 });
			
		} else {
			return true;
		}
	},
	
	validate_username: function(field)
	{
		var input = field.down('input');
		var value = $F(input);
		if (value) {
			_value = value.replace(/[^a-zA-Z0-9-_]/, '');
			if (_value != value) {
				var error = this._buildError('Usernames can only contain letters, numbers, no whitespace and the symbols - and _');
				input.addClassName('error');
				input.insert({ after: error });
				new Effect.BlindDown(error, { duration: 0.3 });
				return false;
			}
			return true;
		}
		return true;
	},
	
	validate_domain: function(field)
	{
		var input = field.down('input');
		var value = $F(input);
		if (value) {
			var error;
			value = value.strip();
			if (!value) {
				error = 'You must provide a domain name.';
			} else {
				// Taken from http://shauninman.com/archive/2006/05/08/validating_domain_names
				var regex = /^([a-z0-9]([-a-z0-9]*[a-z0-9])?\.)+((a[cdefgilmnoqrstuwxz]|aero|arpa)|(b[abdefghijmnorstvwyz]|biz)|(c[acdfghiklmnorsuvxyz]|cat|com|coop)|d[ejkmoz]|(e[ceghrstu]|edu)|f[ijkmor]|(g[abdefghilmnpqrstuwy]|gov)|h[kmnrtu]|(i[delmnoqrst]|info|int)|(j[emop]|jobs)|k[eghimnprwyz]|l[abcikrstuvy]|(m[acdghklmnopqrstuvwxyz]|mil|mobi|museum)|(n[acefgilopruz]|name|net)|(om|org)|(p[aefghklmnrstwy]|pro)|qa|r[eouw]|s[abcdeghijklmnortvyz]|(t[cdfghjklmnoprtvwz]|travel)|u[agkmsyz]|v[aceginu]|w[fs]|y[etu]|z[amw])$/i
				if (!regex.exec(value)) {
					error = 'It appears your domain is invalid. Please double check and try again.';
				}
			}
			if (error) {
				var error = this._buildError(error);
				input.addClassName('error');
				input.insert({ after: error });
				new Effect.BlindDown(error, { duration: 0.3 });
				return false;
			}
		}
		return true;
	},
	
	/*validate_domain: function(field)
	{
		var input = field.down('input');
		var value = $F(input);
		if (value) {
			var error;
			value = value.strip();
			if (!value) {
				error = 'You must provide a domain name.';
			} else if (value.indexOf('.') < 0) {
				return 'Your domain must include at least one full stop.';
			} else if (value.replace(/[\s_]/g, '') != value) {
				return 'Your domain must not include whitespace or underscores.';
			} else {
				var sanitised = this.sanitise_domain(value);
				if (sanitised != value) {
					var error = 'It appears your domain is invalid.';
					if (sanitised) {
						error += '<br /> Maybe you meant: <code>' + sanitised + '</code>';
						return error;
					}
				}
			}
			if (error) {
				var error = this._buildError(error);
				input.addClassName('error');
				input.insert({ after: error });
				new Effect.BlindDown(error, { duration: 0.3 });
				return false;
			}
		}
		return true;
	},*/
	
	sanitise_domain: function(domain)
	{
		domain = domain.replace(/\.{2,}/, '.');
		domain = domain.strip();
		var parts  = domain.split(".");
		var _parts = [];
		var _parts = parts.collect(function(part) {
			part = part.replace(/^[\-\s]/, '');
			part = part.replace(/[\-\s]$/, '');
			part = part.substr(0, 63);
			return part;
		});
		return _parts.join(".");
	},
	
	validate_email: function(field)
	{
		var input = field.down('input');
		var value = $F(input);
		if (value) {
			value = value.strip();
			var error;
			if (!value) {
				error = 'You must provide an email.';
			} else if (value.length < 3) {
				error = 'Your email must be at least 3 characters.';
			} else if (value.indexOf('@') < 0) {
				error = 'This is not a valid email, please check it and try again.';
			} else {
				
				// Split into local and domain parts
				var index  = value.indexOf('@');
				var local  = value.substring(0, index);
				var domain = value.substring(index + 1, value.length);
				
				// Replace invalid characters with nothing
				local = local.replace(/[^a-zA-Z0-9!#$%&\'*+\/=?^_`{|}~\.-]/g, '', local);
				if (!local) {
					error = 'This is not a valid email, please check it and try again.';
				} else if (!domain) {
					error = 'This is not a valid email, please check it and try again.';
				} else {
					domain = this.sanitise_domain(domain);
					var sanitised = local + '@' + domain;
					if (sanitised != value) {
						error = 'It appears your email is invalid.';
						if (sanitised) {
							error += '<br /> Maybe you meant: <code>' + sanitised + '</code>.';
						}
					}
				}
				
			}
			if (error) {
				var error = this._buildError(error);
				input.addClassName('error');
				input.insert({ after: error });
				new Effect.BlindDown(error, { duration: 0.3 });
				return false;
			}
		}
		return true;
	},
	
	validate_cardNumber: function(field)
	{
		var input = field.down('input');
		var value = $F(input);
		if (value) {
			value = value.replace(/[^\d]/g, '');
			var valid = this._checkLuhn(value);
			if (valid) {
				return true;
			} else {
				var error = this._buildError('It appears this isn\'t a valid credit card number.');
				input.addClassName('error');
				input.insert({ after: error });
				new Effect.BlindDown(error, { duration: 0.3 });
				return false;
			}
		} else {
			return true;
		}
	},
	
	validate_postcode: function(field)
	{
		var input = field.down('input');
		var value = $F(input);
		var error;
		if (value) {
			value = value.replace(/[^\d]/g, '');
			if (!value) {
				error = 'This is not a valid postcode';
			} else if (value.length != 4) {
				error = 'Postcodes must be 4 numbers';
			} else {
				return true;
			}
			var error = this._buildError(error);
			input.addClassName('error');
			input.insert({ after: error });
			new Effect.BlindDown(error, { duration: 0.3 });
			return false;
		} else {
			return true;
		}
	},
	
	validate_abn: function(field)
	{
		var input = field.down('input');
		var value = $F(input);
		var error;
		if (value) {
			value = value.replace(/[^\d]/g, '');
			if (!value) {
				error = 'An ABN can only contain numbers.';
			} else if (value.length != 11) {
				error = 'An ABN must be 11 digits long.';
			} else {
				var valid = this._checkABN(value);
				if (!valid) {
					error = 'It appears this isn\'t a valid ABN.';
				} else {
					return true;
				}
			}
			var error = this._buildError(error);
			input.addClassName('error');
			input.insert({ after: error });
			new Effect.BlindDown(error, { duration: 0.3 });
			return false;
		} else {
			return true;
		}
	},
	
	_getClassAttribute: function(element, attr)
	{
		if (!element) return false;
		
		var attrs = this._getClassAttributes(element);
		return attrs.get(attr);
	},
	
	_getClassAttributes: function(element)
	{
		if (!element) return false;
		
		var attributes = element.retrieve('_attr');
		if (attributes == '__empty') {
			return false;
		} else if (attributes) {
			return attributes;
		}
		
		var classes = element.className;
		if (!classes) {
			element.store('_attr', '__empty');
			return false;
		}
		
		var regex = /([^\]|\s]+)\[([^\]]+)\]/g;
		
		var matches = $H();
		while (match = regex.exec(classes)) {
			var _value = matches.get(match[1]);
			if (_value) {
				if (!Object.isArray(_value)) {
					_value = [_value];
				}
				_value.push(match[2]);
			} else {
				_value = match[2];
			}
			matches.set(match[1], _value);
		}
		
		if (matches.size() < 1) {
			element.store('_attr', '__empty');
			return false;
		}
		
		element.store('_attr', matches);
		return matches;
	},
	
	_buildError: function(message)
	{
		return new Element('div', { className: 'error-message' }).insert(
			new Element('p').insert(message)
		).hide();
	},
	
	// Credit card Luhn algorithm
	_checkLuhn: function(number)
	{
		var sum = 0;
		var numdigits = number.length;
		var parity = numdigits % 2;
		$R(0, numdigits - 1).each(function(i) {
			var digit = parseInt(number.charAt(i));
			if (i % 2 == parity) {
				digit *= 2;
			}
			if (digit > 9) {
				digit -= 9;
			}
			sum += digit;
		});
		return (sum % 10) == 0;
	},
	
	_checkABN: function(number)
	{
		var sum = 0;
		var weighting = [10, 1, 3, 5, 7, 9, 11, 13, 15, 17, 19];
		$R(0, weighting.length - 1).each(function(i) {
			var digit = parseInt(number.charAt(i), 10);
			if (i == 0) {
				digit--;
			}
			sum += digit * weighting[i];
		});
		return (sum % 89) == 0;
	},
	
	_isDisplayed: function(element)
	{
		element = $(element);
		while (element && element.parentNode) {
			var display = element.getStyle('display');
			if (display === 'none') {
				return false;
			}
			element = $(element.parentNode);
		}
		return true;
	},
	
	// Better implementation of Prototype
	_serializeElements: function(elements, options)
	{
		if (typeof options != 'object') options = { hash: !!options };
		else if (Object.isUndefined(options.hash)) options.hash = true;
		var key, value, submitted = false, submit = options.submit;
		
		var data = elements.inject({ }, function(result, element) {
			if (!element.disabled && element.name) {
				key = element.name; value = $(element).getValue();
				key = key.replace('[', '').replace(']', '');
				if (value != null && element.type != 'file' && (element.type != 'submit' || (!submitted &&
						submit !== false && (!submit || key == submit) && (submitted = true)))) {
					if (key in result) {
						if (!Object.isArray(result[key])) result[key] = [result[key]];
						result[key].push(value);
					}
					else result[key] = value;
				}
			}
			return result;
		});
		
		return options.hash ? data : Object.toQueryString(data);
	},
	
	// Splits a price into dollars and cents
	_splitPrice: function(price)
	{
		return {
			dollars: Math.floor(price),
			cents:   (price - Math.floor(price)) * 100
		}
	},
	
	// Specific callbacks
	_pricing_windows: function(prices)
	{
		var selectedVPS   = $('vps').down('input[checked]');
		var selectedValue = selectedVPS.readAttribute('value').toLowerCase();
		if (selectedValue == 'h' || selectedValue == 'i') {
			return {
				cost:  prices[1],
				setup: 0
			};
		} else {
			return {
				cost:  prices[0],
				setup: 0
			};
		}
	},
	
	_pricing_backups: function(price_per_gb)
	{
		var selectedVPS   = $('vps').down('input[checked]');
		var selectedValue = selectedVPS.readAttribute('value').toLowerCase();
		
		var vpsInfo = $H(_orderForm.vps).get(selectedValue);
		return {
			cost:  price_per_gb * parseInt(vpsInfo.storageGB, 10),
			setup: 137.5
		}
	}
});
